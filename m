From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80675] [NVAA] Nouveau KMS framebuffer hand-over:
 no/black console on Nvidia MCP78S/C77/GeForce 8300 (10de:0848), X11 ok
Date: Thu, 10 Jul 2014 02:59:43 +0000
Message-ID: <bug-80675-8800-5Ro3tCaexN@http.bugs.freedesktop.org/>
References: <bug-80675-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1803215745=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80675-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1803215745==
Content-Type: multipart/alternative; boundary="1404961183.3ac235742.19658"; charset="us-ascii"


--1404961183.3ac235742.19658
Date: Thu, 10 Jul 2014 02:59:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80675

--- Comment #4 from Jeff <jrsx13-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I believe I am having the same issue, except it is entirely black after KMS is
activated on boot. Even in X11.

I use Debian Testing on a Dell XPS m1730 with SLI Geforce 8700m.


lspci -v |grep 84
03:00.0 VGA compatible controller: NVIDIA Corporation G84M [GeForce 8700M GT]
(rev a1) (prog-if 00 [VGA controller])

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1404961183.3ac235742.19658
Date: Thu, 10 Jul 2014 02:59:43 +0000
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
   title="NEW --- - [NVAA] Nouveau KMS framebuffer hand-over: no/black console on Nvidia MCP78S/C77/GeForce 8300 (10de:0848), X11 ok"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80675#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVAA] Nouveau KMS framebuffer hand-over: no/black console on Nvidia MCP78S/C77/GeForce 8300 (10de:0848), X11 ok"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80675">bug 80675</a>
              from <span class="vcard"><a class="email" href="mailto:jrsx13&#64;gmail.com" title="Jeff &lt;jrsx13&#64;gmail.com&gt;"> <span class="fn">Jeff</span></a>
</span></b>
        <pre>I believe I am having the same issue, except it is entirely black after KMS is
activated on boot. Even in X11.

I use Debian Testing on a Dell XPS m1730 with SLI Geforce 8700m.


lspci -v |grep 84
03:00.0 VGA compatible controller: NVIDIA Corporation G84M [GeForce 8700M GT]
(rev a1) (prog-if 00 [VGA controller])</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1404961183.3ac235742.19658--

--===============1803215745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1803215745==--
