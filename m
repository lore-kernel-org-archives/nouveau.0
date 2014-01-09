From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Thu, 09 Jan 2014 16:35:26 +0000
Message-ID: <bug-58378-8800-FtLeDwHj5n@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2127150654=="
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


--===============2127150654==
Content-Type: multipart/alternative; boundary="1389285326.f54bEe5.20178"; charset="us-ascii"


--1389285326.f54bEe5.20178
Date: Thu, 9 Jan 2014 16:35:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #71 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
Hello Ilia,

hmm - you just caught me with the update five minutes after I had started the
rpmbuild with the previous version... ;-)

Unfortunately, while I could make the first patch apply to a current RHEL
kernel source with only one change (core/engine/device.c ->
core/subdev/device.c), the new patch will need much more rework to make it
compile against a RHEL kernel.

I am therefore looking into getting a 3.12 kernel from the Oracle Linux
"playground":

http://public-yum.oracle.com/repo/OracleLinux/OL6/playground/latest/x86_64/

Would 3.12.6 be an appropriate version to apply your updated patch to
successfully?

Thanks & BR,
Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389285326.f54bEe5.20178
Date: Thu, 9 Jan 2014 16:35:26 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c71">Comment # 71</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre>Hello Ilia,

hmm - you just caught me with the update five minutes after I had started the
rpmbuild with the previous version... ;-)

Unfortunately, while I could make the first patch apply to a current RHEL
kernel source with only one change (core/engine/device.c -&gt;
core/subdev/device.c), the new patch will need much more rework to make it
compile against a RHEL kernel.

I am therefore looking into getting a 3.12 kernel from the Oracle Linux
&quot;playground&quot;:

<a href="http://public-yum.oracle.com/repo/OracleLinux/OL6/playground/latest/x86_64/">http://public-yum.oracle.com/repo/OracleLinux/OL6/playground/latest/x86_64/</a>

Would 3.12.6 be an appropriate version to apply your updated patch to
successfully?

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

--1389285326.f54bEe5.20178--

--===============2127150654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2127150654==--
