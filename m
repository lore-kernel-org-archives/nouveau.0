From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80769] [NVD9] GF119M boot hang with 3.15.2
Date: Tue, 01 Jul 2014 20:58:01 +0000
Message-ID: <bug-80769-8800-Y7XSLVLi9O@http.bugs.freedesktop.org/>
References: <bug-80769-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1910734218=="
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


--===============1910734218==
Content-Type: multipart/alternative; boundary="1404248281.f1Cb2.23599"; charset="us-ascii"


--1404248281.f1Cb2.23599
Date: Tue, 1 Jul 2014 20:58:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80769

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #3)
> (In reply to comment #2)
> > The xorg backtrace has intel_drv.so in it. What makes you say this is a
> > nouveau bug?
> 
> I don't know if nouveau crashes the xserver. Should have stated that more
> clearly, sorry. This may be more a symptom that started to appear with the
> boot hangs and the error messages from the kernel driver.

Ah. So the dmesg is from a perfectly-fine boot, yes? (Other than the error
messages, which are probably not a big deal.)

Can you bisect the boot hang? (Or at least get a dmesg from it, e.g. with
netconsole)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1404248281.f1Cb2.23599
Date: Tue, 1 Jul 2014 20:58:01 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80769#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] GF119M boot hang with 3.15.2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80769">bug 80769</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=80769#c3">comment #3</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=80769#c2">comment #2</a>)
&gt; &gt; The xorg backtrace has intel_drv.so in it. What makes you say this is a
&gt; &gt; nouveau bug?
&gt; 
&gt; I don't know if nouveau crashes the xserver. Should have stated that more
&gt; clearly, sorry. This may be more a symptom that started to appear with the
&gt; boot hangs and the error messages from the kernel driver.</span >

Ah. So the dmesg is from a perfectly-fine boot, yes? (Other than the error
messages, which are probably not a big deal.)

Can you bisect the boot hang? (Or at least get a dmesg from it, e.g. with
netconsole)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1404248281.f1Cb2.23599--

--===============1910734218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1910734218==--
