---
layout: lesson
carpentry: "swc"
venue: 
address: 
country: "UK"
language: "English"
latlng: 
humandate: 
humantime: 
startdate: 
enddate: 
instructor: ["Holly Judge, Arno Proeme, and Julien Sindt"]
helper: []
email: ["J.Sindt@ed.ac.uk"]
collaborative_notes: 
eventbrite: 
root: .
---

<h2>Description</h2>

  The material here is for the second day of the 3-day "Introduction to 
  high-performance computing for life scientists" course. Additional 
  information about this course can be found 
  [here](https://events.prace-ri.eu/event/1304/overview).

  High-performance computing (HPC) is a fundamental technology used to solve 
  a wide range of scientific research problems. Many important challenges in 
  science such as protein folding, the search for the Higgs boson, drug 
  discovery, and the development of nuclear fusion all depend on simulations, 
  models and analyses run on HPC facilities to make progress.

  This course introduces HPC to life science researchers, focusing on the 
  aspects that are most important for those new to this technology to 
  understand. It will help you judge how HPC can best benefit your research, 
  and equip you to go on to successfully and efficiently make use of HPC 
  facilities in future. The course will cover basic concepts in HPC hardware, 
  software, user environments, filesystems, and programming models. It also 
  provides an opportunity to gain hands-on practical experience and assistance 
  using an HPC system (ARCHER2, the UK national supercomputing service) 
  through examples drawn from the life sciences, such as biomolecular 
  simulation.

  This course is presented by:
  
  {% include figure.html url="" max-width="80%" file="/fig/banner.jpg"%}

<hr/>


<h2 id="general">General Information</h2>

{% comment %}
  LOCATION

  This block displays the address and links to maps showing directions
  if the latitude and longitude of the workshop have been set.  You
  can use https://itouchmap.com/latlong.html to find the lat/long of an
  address.
{% endcomment %}
{% if page.latlng %}
<p id="where">
  <strong>Where:</strong>
  {{page.address}}.
  Get directions with
  <a href="//www.openstreetmap.org/?mlat={{page.latlng | replace:',','&mlon='}}&zoom=16">OpenStreetMap</a>
  or
  <a href="//maps.google.com/maps?q={{page.latlng}}">Google Maps</a>.
</p>
{% endif %}

{% comment %}
  DATE

  This block displays the date and links to Google Calendar.
{% endcomment %}
{% if page.humandate %}
<p id="when">
  <strong>When:</strong>
  {{page.humandate}}.
  {% include workshop_calendar.html %}
</p>
{% endif %}

{% comment %}
  SPECIAL REQUIREMENTS

  Modify the block below if there are any special requirements.
{% endcomment %}
<p id="requirements">
  <strong>Requirements:</strong> Participants must have their own local 
  workstation (such as a laptop or desktop) with a Mac, Linux, or Windows 
  operating system (not a tablet, Chromebook, etc.) on which they have 
  administrative privileges. They should have a few specific software packages 
  installed (listed
  <a href="#setup">below</a>).
</p>

{% comment %}
  ACCESSIBILITY

  Modify the block below if there are any barriers to accessibility or
  special instructions.
{% endcomment %}
<p id="accessibility">
  <strong>Accessibility:</strong> We are committed to making this workshop
  accessible to everybody.
  Where the course is being run in person and face-to-face, the workshop 
  organizers have checked that:
</p>
<ul>
  <li>The room is wheelchair / scooter accessible.</li>
  <li>Accessible restrooms are available.</li>
</ul>
<p>
  All course materials will be provided in advance of the lesson 
  online. If we can help making learning easier for
  you (e.g. sign-language interpreters, lactation facilities) please
  get in touch (using contact details below) and we will
  attempt to provide them.
</p>

{% comment %}
  CONTACT EMAIL ADDRESS

  Display the contact email address set in the configuration file.
{% endcomment %}
<p id="contact">
  <strong>Contact</strong>:
  Please email
  {% if page.email %}
    {% for email in page.email %}
      {% if forloop.last and page.email.size > 1 %}
        or
      {% else %}
        {% unless forloop.first %}
        ,
        {% endunless %}
      {% endif %}
      <a href='mailto:{{email}}'>{{email}}</a>
    {% endfor %}
  {% else %}
    to-be-announced
  {% endif %}
  for more information.
</p>

<hr/>

> ## Prerequisites
> You should be happy with connecting using basic `bash` commands, such as 
> `cd`, `mv`, `cp`, and `ssh`. Familiarity with using the Linux command line
> will be useful, but you do not need to be an epexrt in shell scripting. You 
> should also be happy  editing plain text files in a remote terminal (or, 
> alternatively, editing them on your local system and copying them to the 
> remote HPC system using `scp`).
{: .prereq}

<hr/>

{% include links.md %}
