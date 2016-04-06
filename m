From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79518] nouveau causes lockup and reboot on GT215
Date: Wed, 06 Apr 2016 20:27:40 +0000
Message-ID: <bug-79518-8800-d4DBBfqffT@http.bugs.freedesktop.org/>
References: <bug-79518-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1856282945=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79518-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1856282945==
Content-Type: multipart/alternative; boundary="14599744601.515eead81.10932";
 charset="UTF-8"


--14599744601.515eead81.10932
Date: Wed, 6 Apr 2016 20:27:40 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=79518

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Adam Borowski from comment #5)
> > Unfortunately I have no clue why those timeouts happen... basically it's an indication that the GPU is "done".
> 
> I believe my hardware itself is ok, at least as in "never had any issue with
> the proprietary driver".  Those bastards dropped support for GT215 though...

Yeah, I'm sure your HW is fine. But it just stops responding (reasonably) to
nouveau when this happens, and we don't know what to do about it. Perhaps this
is "normal" and the blob drivers know how to kick it in that case. Or perhaps
we're doing something wrong to push the hw over the brink of sanity.

> > Perhaps the memory comes up in a (slightly) funny state? You could try reclocking it and see if that improves matters, have a look in /sys/kernel/debug/dri/0/pstate for the available perf levels, you can echo those values in to change states.
> 
> What values would you suggest?  I'm afraid I did not find documentation
> that's idiot-proof -- and I sadly got exactly 0 clue about this kind of
> stuff so I require some handholding to give you useful debug info.

cat /sys/kernel/debug/dri/0/pstate

I can provide more instructions when you give me the output of that.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14599744601.515eead81.10932
Date: Wed, 6 Apr 2016 20:27:40 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau causes lockup and reboot on GT215"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79518#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau causes lockup and reboot on GT215"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79518">bug 79518</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Adam Borowski from <a href="show_bug.cgi?id=79518#c5">comment #5</a>)
<span class="quote">&gt; &gt; Unfortunately I have no clue why those timeouts happen... basically it's an indication that the GPU is &quot;done&quot;.
&gt; 
&gt; I believe my hardware itself is ok, at least as in &quot;never had any issue with
&gt; the proprietary driver&quot;.  Those bastards dropped support for GT215 though...</span >

Yeah, I'm sure your HW is fine. But it just stops responding (reasonably) to
nouveau when this happens, and we don't know what to do about it. Perhaps this
is &quot;normal&quot; and the blob drivers know how to kick it in that case. Or perhaps
we're doing something wrong to push the hw over the brink of sanity.

<span class="quote">&gt; &gt; Perhaps the memory comes up in a (slightly) funny state? You could try reclocking it and see if that improves matters, have a look in /sys/kernel/debug/dri/0/pstate for the available perf levels, you can echo those values in to change states.
&gt; 
&gt; What values would you suggest?  I'm afraid I did not find documentation
&gt; that's idiot-proof -- and I sadly got exactly 0 clue about this kind of
&gt; stuff so I require some handholding to give you useful debug info.</span >

cat /sys/kernel/debug/dri/0/pstate

I can provide more instructions when you give me the output of that.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14599744601.515eead81.10932--

--===============1856282945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1856282945==--
