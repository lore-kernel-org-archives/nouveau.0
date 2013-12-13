From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Fri, 13 Dec 2013 19:03:38 +0000
Message-ID: <bug-58378-8800-My8BZHq2BX@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1626179153=="
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


--===============1626179153==
Content-Type: multipart/alternative; boundary="1386961418.EaD5ACA86.11167"; charset="us-ascii"


--1386961418.EaD5ACA86.11167
Date: Fri, 13 Dec 2013 19:03:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #23 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
The mega-commit is ebb945a94bba2ce8dff7b0942ff2b3f2a52a0a69. So you could check
out ebb945a94bba^ and see if it works, and then test ebb945a94bba to see if it
doesn't. In either case, you could use those as your new "good" or "bad"
starting points.

You can do a clone with like --depth 1 or something. Not sure how to do that at
a commit. Also I'd recommend against it, it'll just be more downloading later
on if things don't pan out. A full git clone of the linux kernel is ~800MB (+
space to actually store the files, but that's all part of the 800MB). In fact,
I don't even know if that 818MB is compressed or not -- I'd guess not, so the
download is probably much smaller.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386961418.EaD5ACA86.11167
Date: Fri, 13 Dec 2013 19:03:38 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c23">Comment # 23</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>The mega-commit is ebb945a94bba2ce8dff7b0942ff2b3f2a52a0a69. So you could check
out ebb945a94bba^ and see if it works, and then test ebb945a94bba to see if it
doesn't. In either case, you could use those as your new &quot;good&quot; or &quot;bad&quot;
starting points.

You can do a clone with like --depth 1 or something. Not sure how to do that at
a commit. Also I'd recommend against it, it'll just be more downloading later
on if things don't pan out. A full git clone of the linux kernel is ~800MB (+
space to actually store the files, but that's all part of the 800MB). In fact,
I don't even know if that 818MB is compressed or not -- I'd guess not, so the
download is probably much smaller.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386961418.EaD5ACA86.11167--

--===============1626179153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1626179153==--
