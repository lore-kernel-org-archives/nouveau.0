From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77574] Minor screen corruption on NVAF card
Date: Thu, 17 Apr 2014 14:35:19 +0000
Message-ID: <bug-77574-8800-hzyt7bUziz@http.bugs.freedesktop.org/>
References: <bug-77574-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0228282008=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77574-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0228282008==
Content-Type: multipart/alternative; boundary="1397745319.7c13C4e72.12681"; charset="us-ascii"


--1397745319.7c13C4e72.12681
Date: Thu, 17 Apr 2014 14:35:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77574

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #3)
> > You seem to have a nouveau.config=PCE0=0 somewhere.
> 
> I'll try to track it down. Could it be the issue?

I checked the code... there's a

    bool enable = (nv_device(parent)->chipset != 0xaf);

So that's probably the reason why it's disabled. No idea why that's the case on
NVAF, but I'm guessing that the person who put that in knew what they were
doing.

It also shouldn't cause problems for it to be disabled, I was just curious why
it was.

> 
> > Are there other options set?
> 
> Where can I look at the list? /etc/modprobe.d/ is empty now
> 
> > Is the resume issue a new one? (i.e. did it work OK with older kernels?)
> 
> Earlier there was Debian. With kernel 3.10 it was worse - dashed line
> persisted even on clean boot (without suspend -> wake).

Hm, OK. Sorry, no great advice from me :(

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397745319.7c13C4e72.12681
Date: Thu, 17 Apr 2014 14:35:19 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Minor screen corruption on NVAF card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77574#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Minor screen corruption on NVAF card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77574">bug 77574</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=77574#c3">comment #3</a>)
<span class="quote">&gt; &gt; You seem to have a nouveau.config=PCE0=0 somewhere.
&gt; 
&gt; I'll try to track it down. Could it be the issue?</span >

I checked the code... there's a

    bool enable = (nv_device(parent)-&gt;chipset != 0xaf);

So that's probably the reason why it's disabled. No idea why that's the case on
NVAF, but I'm guessing that the person who put that in knew what they were
doing.

It also shouldn't cause problems for it to be disabled, I was just curious why
it was.

<span class="quote">&gt; 
&gt; &gt; Are there other options set?
&gt; 
&gt; Where can I look at the list? /etc/modprobe.d/ is empty now
&gt; 
&gt; &gt; Is the resume issue a new one? (i.e. did it work OK with older kernels?)
&gt; 
&gt; Earlier there was Debian. With kernel 3.10 it was worse - dashed line
&gt; persisted even on clean boot (without suspend -&gt; wake).</span >

Hm, OK. Sorry, no great advice from me :(</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397745319.7c13C4e72.12681--

--===============0228282008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0228282008==--
