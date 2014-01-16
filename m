From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Thu, 16 Jan 2014 00:18:18 +0000
Message-ID: <bug-58378-8800-9HPdfkubTK@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0005561764=="
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


--===============0005561764==
Content-Type: multipart/alternative; boundary="1389831498.71a5aC3.26650"; charset="us-ascii"


--1389831498.71a5aC3.26650
Date: Thu, 16 Jan 2014 00:18:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #84 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
Hi Ilia,

> That seems a little premature given that it's not even in the mainline
> kernel. However I would recommend that once it is, you file a redhat issue
> to make sure it gets backported to the whatever. I have no knowledge of, and
> do not care about RHEL or any non-mainline kernel. If you do, work with
> whatever processes they have. I bug Ben about enough stuff already :)

ouch - that's a pity... :-(

As stated earlier, as I am using the free (only as in beer...) Oracle Linux
version rather than a commercial pais RHEL license, I cannot file any issues
with them, so I was hoping about you being able to raise this with him within
the nouveau team. It clearly deserves a fix, but I won't be able to drive
anything myself here due to the lack of a paid license... :-(

Oh, and one more thing by the way:

Interestingly, I can also confirm that for me, the proprietary NVidia "blob"
Unix driver version 331.38 (which has just been released this week):

https://devtalk.nvidia.com/default/topic/672875

indeed has also fixed the long-standing hang issue with their drivers for my
Quadro NVS 130M on both Linux and Solaris. Even better news is that the fix
will also be integrated into the next R331 release for Windows (it is not yet
in Windows versions 331.93 or 332.21)!

But while it took NVidia a little less than two years between introducing their
regression bug (all releases since 285.x are affected), you/the nouveau team
have tracked down and fixed this issue in just a couple of days... :-)

So thanks again for your great work on nouveau! :-)

BR,
Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389831498.71a5aC3.26650
Date: Thu, 16 Jan 2014 00:18:18 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c84">Comment # 84</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre>Hi Ilia,

<span class="quote">&gt; That seems a little premature given that it's not even in the mainline
&gt; kernel. However I would recommend that once it is, you file a redhat issue
&gt; to make sure it gets backported to the whatever. I have no knowledge of, and
&gt; do not care about RHEL or any non-mainline kernel. If you do, work with
&gt; whatever processes they have. I bug Ben about enough stuff already :)</span >

ouch - that's a pity... :-(

As stated earlier, as I am using the free (only as in beer...) Oracle Linux
version rather than a commercial pais RHEL license, I cannot file any issues
with them, so I was hoping about you being able to raise this with him within
the nouveau team. It clearly deserves a fix, but I won't be able to drive
anything myself here due to the lack of a paid license... :-(

Oh, and one more thing by the way:

Interestingly, I can also confirm that for me, the proprietary NVidia &quot;blob&quot;
Unix driver version 331.38 (which has just been released this week):

<a href="https://devtalk.nvidia.com/default/topic/672875">https://devtalk.nvidia.com/default/topic/672875</a>

indeed has also fixed the long-standing hang issue with their drivers for my
Quadro NVS 130M on both Linux and Solaris. Even better news is that the fix
will also be integrated into the next R331 release for Windows (it is not yet
in Windows versions 331.93 or 332.21)!

But while it took NVidia a little less than two years between introducing their
regression bug (all releases since 285.x are affected), you/the nouveau team
have tracked down and fixed this issue in just a couple of days... :-)

So thanks again for your great work on nouveau! :-)

BR,
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

--1389831498.71a5aC3.26650--

--===============0005561764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0005561764==--
