From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Mon, 16 Dec 2013 14:18:21 +0000
Message-ID: <bug-58378-8800-WYpWDiVeNE@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0438272436=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0438272436==
Content-Type: multipart/alternative; boundary="1387203501.DAcB065.4999"; charset="us-ascii"


--1387203501.DAcB065.4999
Date: Mon, 16 Dec 2013 14:18:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #39 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
> You really want to be doing a git bisect to do the least amount of work; I
> don't see what you mean by "move forward" but I really hope that you are
> testing the commits in a binary tree style.

Yup. Indeed, I am trying to use a "binary" approach to minimize work, but am
not using git bisect, but hope to augment augment cutting the solution tree in
half by reading the commit comments and letting my intellect suggest which ones
look like more or less likely candidates...

> You can put the tarball-based process in a script so you only need to run a
> single command after moving further in the bisection.

I have indeed already done so (not based on git bisect, but a commit id).

Note that while I'm indeed a complete newbie to git, I am not at all a newbie
Linux/Unix shell scripting. In my main job, though, I am a Java
architect/developer/support engineer, so I typically am only a "dummy user" of
Linux kernels - unless it very rarely happens that something breaks which is
really important for me, so I try and see whether I can help... ;-)

I started trying to drive this forward when I became suddenly affected by this
issue because it has indeed been introduced into RHEL6 mainline kernels with
the most recent RHEL 6.5 kernel update - so I hope that once we're done and you
have been able to successfully fix the issue, you can take care of the fix also
being ported into subsequent RHEL6 kernels (working at Red Hat, I hope that Ben
Skeggs should hopefully be interested enough in doing so...).

Will report back here as soon as I have been able to track things down to a
particular commit... :-)

Thanks & BR,
Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387203501.DAcB065.4999
Date: Mon, 16 Dec 2013 14:18:21 +0000
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
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c39">Comment # 39</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre><span class="quote">&gt; You really want to be doing a git bisect to do the least amount of work; I
&gt; don't see what you mean by &quot;move forward&quot; but I really hope that you are
&gt; testing the commits in a binary tree style.</span >

Yup. Indeed, I am trying to use a &quot;binary&quot; approach to minimize work, but am
not using git bisect, but hope to augment augment cutting the solution tree in
half by reading the commit comments and letting my intellect suggest which ones
look like more or less likely candidates...

<span class="quote">&gt; You can put the tarball-based process in a script so you only need to run a
&gt; single command after moving further in the bisection.</span >

I have indeed already done so (not based on git bisect, but a commit id).

Note that while I'm indeed a complete newbie to git, I am not at all a newbie
Linux/Unix shell scripting. In my main job, though, I am a Java
architect/developer/support engineer, so I typically am only a &quot;dummy user&quot; of
Linux kernels - unless it very rarely happens that something breaks which is
really important for me, so I try and see whether I can help... ;-)

I started trying to drive this forward when I became suddenly affected by this
issue because it has indeed been introduced into RHEL6 mainline kernels with
the most recent RHEL 6.5 kernel update - so I hope that once we're done and you
have been able to successfully fix the issue, you can take care of the fix also
being ported into subsequent RHEL6 kernels (working at Red Hat, I hope that Ben
Skeggs should hopefully be interested enough in doing so...).

Will report back here as soon as I have been able to track things down to a
particular commit... :-)

Thanks &amp; BR,
Andreas</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387203501.DAcB065.4999--

--===============0438272436==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0438272436==--
