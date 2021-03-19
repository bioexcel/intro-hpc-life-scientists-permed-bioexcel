---
title: "LECTURE: Measuring Parallel Performance"
teaching: 20
exercises: 10
questions:
- "What is performance and how is it measured?"
- "What is scalability?"
- "What is meant by strong and weak scaling?"
objectives:
- "Learning how to measure the performance of software."
- "Understanding the difference between strong and weak scaling."
- ""
keypoints:
- "To be determined"
---

## Parallel performance

> ## Why do we run applications in parallel?
> 
> In the course etherpad, write down why you think running applications in 
> parallel is useful.
> 
{: .challenge}

In general, there are two advantages to running applications in parallel: 
(1) applications will run more quickly and we can get our solutions faster, 
and (2) we can solve larger, more complex problems.

In an ideal world, if we increase the number of cores we are using by a 
factor of 10, we should be able to either get the solution to our current 
problem 10 times faster, or to run a system 10 times bigger in the same 
amount of time as now.

Unfortunately, this is often not the case...

### How to measure parallel performance?

Measuring parallel performance can help us to understand:

- whether our application is making the most of the cores assigned to it
- the factors that can improve or hinder performance
- how best to use the application and available HPC resources

But, how do we quantify performance when running in parallel? Consider 
a system with an execution time of *T* - this time will depend on the 
size/complexity *N* of the system and the number of processors/cores *P* being 
used to run this system. One way to measure performance could be to consider 
the speedup of the system compared with a run on a single processor:

![formula](https://render.githubusercontent.com/render/math?math=S(N,P) = \frac{T(N,1)}{T(N,P)}).

Ideally, the speedup increases in a linear fashion, meaning that as you double 
the number of processors used, your speedup will also double. However, this is 
rarely the case.

Another metric to consider is the parallel efficiency *E*(*N*, *P*). This is 
a measure of how the speedup changes as the number of processors used is 
increased:

![formula](https://render.githubusercontent.com/render/math?math=E(N,P) = \frac{S(N,P)}{P} = \frac{T(N,1)}{P T(N,P)}).

Given that, in general, *S*(*N*, *P*) < *P*, it follows that *E*(*N*, *P*) < 1.

Finally, it can be useful to estimate the efficiency of the parts of your code 
that run only in parallel. The serial efficiency *E*(*N*) is measured by:

![formula](https://render.githubusercontent.com/render/math?math=E(N) = \frac{T_{best}(N)}{T(N,1)}).

## Strong vs. weak scaling

> ## Proof of Amdhal's Law
> 
> Consider a typical program -- this will have sections of code that could 
> potentially run in parallel, and sections that are inherently serial and 
> can't run in parallel. Let's further suppose that the serial code accounts 
> for a fraction α of its runtime. If we can parallelise the potentially 
> parallel part of the code with 100% efficience, then:
> - the hypothetical runtime in parallel is: 
> <img src="https://render.githubusercontent.com/render/math?math=T(N,P) = \alpha T(N,1) %2B \frac{(1-\alpha)T(N,1)}{P}">
> - the hypothetical speedup is: ![formula](https://render.githubusercontent.com/render/math?math=S(N,P) = \frac{T(N,1)}{T(N,P)} = \frac{P}{\alpha P %2B (1 - \alpha)}).
>
> This means that speedup is fundamentally limited by the serial fraction. No 
> matter how large P becomes, the speedup <img src="https://render.githubusercontent.com/render/math?math=S(N,P) < \alpha^{-1}">
>
> ### Example for &alpha; = 0.1
> - On 2 processors, the hypothetical speedup is *S*(*N*, *P*) = 1.8
> - On 16 processors, the hypothetical speedup is *S*(*N*, *P*) = 6.4
> - On 1024 processors, the hypothetical speedup is *S*(*N*, *P*) =  9.9
>
{: .callout}


> ## Proof of Gustafson's Law
> 
> Let's assume that the parallel contribution to runtime is proportional 
> to the size of the system *N*. Then, the total runtime on *P* processors 
> is:
> ![formula](https://render.githubusercontent.com/render/math?math=T(N,P) = T_{serial}(N,P) %2B T_{parallel}(N,P))
> ![formula](https://render.githubusercontent.com/render/math?math== \alpha T(1,1) %2B \frac{(1 - \alpha)NT(1,1)}{P})
> The total runtime on a single processor is:
> ![formula](https://render.githubusercontent.com/render/math?math=T(N,1) = \alpha(1,1) %2B (1-\alpha)NT(1,1))
> where &alpha; is the non-parallelisable fraction of the code.
> It follows that the speedup:
> ![formula](https://render.githubusercontent.com/render/math?math=S(N,P) = \frac{T(N,1)}{T(N,P)} = \frac{\alpha %2B (1-\alpha)N}{\alpha %2B (1-\alpha) \frac{N}{P}})
> If we scale the problem size with the number of processors (*e.g.* by setting *N* = 
> *P* for weak scaling), then we expect a speedup 
> *S*(*P*, *P*) = &alpha; + (1 - &alpha;)*P*
> , and an efficiency
> *E*(*P*, *P*) = &alpha; / P + (1 - &alpha;).
{: .callout}





## Improving performance

{% include links.md %}

