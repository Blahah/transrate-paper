# Background

The use of RNA-seq for de-novo transcriptome assembly is a complex procedure, but if done well can yield valuable, high throughput biological insights at relatively low cost (e.g. [*list a few nice transcriptomics papers]).

A transcriptome assembly pipeline might include trimming adapters and low quality bases, read error correction, digital normalisation, assembly and post-assembly improvements such as scaffolding and clustering.

Because the computational problems involved in these steps are hard to solve [*cite], there are many competing approaches.

For example, popular tools for the assembly step include Trinity [@grabherr_full-length_2011], Oases [@schulz_oases:_2012], Trans-AbySS [@robertson_novo_2010], IDBA-tran [@peng_idba-tran:_2013] and SOAPdenovo-Trans [@xie_soapdenovo-trans:_2014], among many others.

Each of these tools implements a complex algorithm with many heuristics and parameters that can often be user-controlled.

Furthermore, because each organism has unique genomic properties, the algorithms need to be selected and tuned carefully for each experiment.

These conditions mean that any de-novo transcriptome experiment should ideally involve comparison of assemblies from across a potentially vast parameter space. For this to be tractable, a method is required to accurately judge the quality of transcriptome assemblies.

In addition to quality varying between assemblies, contigs within an assembly can have varying levels of usefulness. Any transcriptome assembly is likely to contain well-assembled contigs that represent full-length transcripts, as well as poorly assembled contigs that are incomplete or erroneous reconstructions of transcripts, and nonsense contigs that are artefacts of the assembly algorithm.

It is therefore desirable to be able to select out the well-assembled contigs, likely to be of use in downstream biological interpretation, from those that are not suitable for downstream use.

Compared to transcriptome assemblies, evaluation of the quality of genome and metagenome assemblies is a relatively mature field. Approaches include providing a range of basic metrics about assemblies [@gurevich_quast:_2013], or explicitly modelling the sequencing and assembly process to provide a likelihood-based measure of quality [@clark_ale:_2013, @rahman_cgal:_2013].

Some authors have used reference-based measures for evaluation of de-novo transcriptome assemblies [@elijah_k_lowe_evaluating_2014; @oneil_assessing_2013, @oneil_population-level_2010]. However, in most cases, a high-quality, closely related reference transcriptome is not available, limiting the usefulness of these metrics in practice [@li_evaluation_2014].

To date, only a single published reference-free transcriptome assembly evaluation tool, RSEM-EVAL [@li_evaluation_2014], takes a statistically principled approach to transcriptome assembly quality evaluation.

In this work we describe transrate, our software for deep quality analysis of transcriptome assemblies. transrate implements two novel reference-free statistics, the transrate contig score and the transrate assembly score, which allow for optimisation within and between assemblers respectively, using only the assembly and the paired-end reads used to generate it.

Unlike existing reference-free statistical approaches to assembly evaluation, the transrate scores are made up of components that are independently useful in identifying specific problems with contigs, namely gene family collapse, fragmentation or chimerism.

transrate uses these components to classify the contigs in an assembly, outputting separate files containing the well-assembled contigs, those that could be improved by scaffolding, those that required chimera splitting, and those that are poor quality in multiple or other ways.

Furthermore, the transrate model is descriptive rather than generative, making it considerably easier for users to understand and interpret than existing methods.

We show that transrate improves upon the state of the art in several key ways: Firstly, we show that transrate is more accurate than existing reference-free measures when tested using real and simulated data, with a better ability to identify common types of misassembly, as well as being significantly faster. Secondly, we demonstrate that the reference-free transrate contig score outperforms existing reference-based metrics even when a same-species reference is used. Finally, we demonstrate that using the transrate contig score to select the optimal subset of contigs from an assembly improves the biological utility of assemblies.