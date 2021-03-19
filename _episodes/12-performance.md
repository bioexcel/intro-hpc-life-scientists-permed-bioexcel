---
title: "LECTURE: Measuring Parallel Performance"
teaching: 30
exercises: 0
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

Measuring parallel performance can help us to understand:

- whether our application is making the most of the cores assigned to it
- the factors that can improve or hinder performance
- how best to use the application and available HPC resources

### Defining performance using LAMMPS


![formula](https://render.githubusercontent.com/render/math?math=S(N,P) = \frac{T(N,1)}{T(N,P)})

![formula](https://render.githubusercontent.com/render/math?math=E(N,P) = \frac{S(N,P)}{P} = \frac{T(N,1)}{P T(N,P)})

![formula](https://render.githubusercontent.com/render/math?math=E(N) = \frac{T_{best}(N)}{T(N,1)})

## Strong vs. weak scaling

> ## Proof of Amdhal's Law
> 
> Consider a typical program -- this will have sections of code that could 
> potentially run in parallel, and sections that are inherently serial and 
> can't run in parallel. Let's further suppose that the serial code accounts 
> for a fraction <img src="https://render.githubusercontent.com/render/math?math=\alpha">
> of its runtime. If we can parallelise the potentially parallel part of the 
> code with 100% efficience, then:
> - the hypothetical runtime in parallel is: <img src="https://render.githubusercontent.com/render/math?math=T(N,P) = \alpha T(N,1) %2B \frac{(1-\alpha)T(N,1)}{P}&mode=inline">
> - the hypothetical speedup is: <img src="https://render.githubusercontent.com/render/math?math=S(N,P) = \frac{T(N,1)}{T(N,P)} = \frac{P}{\alpha P %2B (1 - \alpha)}&mode=inline">.
>
> This means that speedup is fundamentally limited by the serial fraction. No 
> matter how large P becomes, the speedup <img src="https://render.githubusercontent.com/render/math?math=S(N,P) < \alpha^{-1}"&mode=inline>
>
> ### Example for <img src="https://render.githubusercontent.com/render/math?math=\alpha = 0.1"&mode=inline>:
> - On 2 processors, the hypothetical speedup is https://render.githubusercontent.com/render/math?math=S(N,P) = 1.8"&mode=inline>
> - On 16 processors, the hypothetical speedup is https://render.githubusercontent.com/render/math?math=S(N,P) = 6.4"&mode=inline>
> - On 1024 processors, the hypothetical speedup is https://render.githubusercontent.com/render/math?math=S(N,P) = 9.9"&mode=inline>
>
{: .callout}


> ## Proof of Gustafson's Law
> 
> 
![formula](https://render.githubusercontent.com/render/math?math=S(N,P) = \frac{P}{\alpha P %2B (1 - \alpha)})

![formula](https://render.githubusercontent.com/render/math?math=T(N,P) = T_{serial}(N,P) %2B T_{parallel}(N,P))

![formula](https://render.githubusercontent.com/render/math?math= = \alpha T(1,1) + \frac{(1 - \alpha)(NT(1,1)}{P})

![formula](https://render.githubusercontent.com/render/math?math=T(N,1) = \alpha(1,1) %2B (1-\alpha)NT(1,1))

![formula](https://render.githubusercontent.com/render/math?math=S(N,P) = \frac{T(N,1)}{T(N,P)} = \frac{\alpha %2B (1-\alpha)N}{\alpha %2B (1-\alpha) \frac{N}{P}})



## Improving performance

{% include links.md %}

