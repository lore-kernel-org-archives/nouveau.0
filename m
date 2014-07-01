From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80769] [NVD9] GF119M boot hang with 3.15.2
Date: Tue, 01 Jul 2014 21:44:40 +0000
Message-ID: <bug-80769-8800-KD5ollEeVX@http.bugs.freedesktop.org/>
References: <bug-80769-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2139293018=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80769-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2139293018==
Content-Type: multipart/alternative; boundary="1404251080.11d51A81.737"; charset="us-ascii"


--1404251080.11d51A81.737
Date: Tue, 1 Jul 2014 21:44:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80769

--- Comment #5 from sven <sven.pilz+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #4)
> (In reply to comment #3)
> > (In reply to comment #2)
> > > The xorg backtrace has intel_drv.so in it. What makes you say this is a
> > > nouveau bug?
> > 
> > I don't know if nouveau crashes the xserver. Should have stated that more
> > clearly, sorry. This may be more a symptom that started to appear with the
> > boot hangs and the error messages from the kernel driver.
> 
> Ah. So the dmesg is from a perfectly-fine boot, yes? (Other than the error
> messages, which are probably not a big deal.)

Yes.


> Can you bisect the boot hang? (Or at least get a dmesg from it, e.g. with
> netconsole)

I now tried a couple of boots in a row and one of them actually succeeded (with
glxgears and own OpenGL applications). But the other times it got stuck during
boot, though not always before the switch to native resolution. One hanged with
some systemd error (rfkill stuff). I will try to get more information. But it
looks like there may be a couple of problems or everything is just a symptom of
some deeper one. Which still is strange is that the symptoms disappear when I
switch to the Intel card or Optimus in the BIOS. Maybe some ACPI problems and
nothing directly related to nouveau.

Sorry for bothering you with that :-). I guess you should close the bug and if
I find something related to nouveau I'll open a new one.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1404251080.11d51A81.737
Date: Tue, 1 Jul 2014 21:44:40 +0000
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
   title="NEW --- - [NVD9] GF119M boot hang with 3.15.2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80769#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] GF119M boot hang with 3.15.2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80769">bug 80769</a>
              from <span class="vcard"><a class="email" href="mailto:sven.pilz+freedesktop&#64;gmail.com" title="sven &lt;sven.pilz+freedesktop&#64;gmail.com&gt;"> <span class="fn">sven</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=80769#c4">comment #4</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=80769#c3">comment #3</a>)
&gt; &gt; (In reply to <a href="show_bug.cgi?id=80769#c2">comment #2</a>)
&gt; &gt; &gt; The xorg backtrace has intel_drv.so in it. What makes you say this is a
&gt; &gt; &gt; nouveau bug?
&gt; &gt; 
&gt; &gt; I don't know if nouveau crashes the xserver. Should have stated that more
&gt; &gt; clearly, sorry. This may be more a symptom that started to appear with the
&gt; &gt; boot hangs and the error messages from the kernel driver.
&gt; 
&gt; Ah. So the dmesg is from a perfectly-fine boot, yes? (Other than the error
&gt; messages, which are probably not a big deal.)</span >

Yes.


<span class="quote">&gt; Can you bisect the boot hang? (Or at least get a dmesg from it, e.g. with
&gt; netconsole)</span >

I now tried a couple of boots in a row and one of them actually succeeded (with
glxgears and own OpenGL applications). But the other times it got stuck during
boot, though not always before the switch to native resolution. One hanged with
some systemd error (rfkill stuff). I will try to get more information. But it
looks like there may be a couple of problems or everything is just a symptom of
some deeper one. Which still is strange is that the symptoms disappear when I
switch to the Intel card or Optimus in the BIOS. Maybe some ACPI problems and
nothing directly related to nouveau.

Sorry for bothering you with that :-). I guess you should close the bug and if
I find something related to nouveau I'll open a new one.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1404251080.11d51A81.737--

--===============2139293018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2139293018==--
