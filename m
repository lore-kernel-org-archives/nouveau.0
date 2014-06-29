From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80675] [NVAA] Nouveau KMS framebuffer hand-over:
 no/black console on Nvidia MCP78S/C77/GeForce 8300 (10de:0848), X11 ok
Date: Sun, 29 Jun 2014 20:11:56 +0000
Message-ID: <bug-80675-8800-9qe37YoxkO@http.bugs.freedesktop.org/>
References: <bug-80675-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1568676393=="
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


--===============1568676393==
Content-Type: multipart/alternative; boundary="1404072716.fe134E1.12742"; charset="us-ascii"


--1404072716.fe134E1.12742
Date: Sun, 29 Jun 2014 20:11:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80675

--- Comment #3 from Walter Haidinger <walter.haidinger-RbZlAiThDcE@public.gmane.org> ---
No changes if I omit the console=fb0 and/or video= option.
Using a different resolution for video= sets the X11 screen accordingly,
though.

I also recall that I've added those two in an effort to get a working console.
But that obviously did not help.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1404072716.fe134E1.12742
Date: Sun, 29 Jun 2014 20:11:56 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80675#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVAA] Nouveau KMS framebuffer hand-over: no/black console on Nvidia MCP78S/C77/GeForce 8300 (10de:0848), X11 ok"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80675">bug 80675</a>
              from <span class="vcard"><a class="email" href="mailto:walter.haidinger&#64;gmx.at" title="Walter Haidinger &lt;walter.haidinger&#64;gmx.at&gt;"> <span class="fn">Walter Haidinger</span></a>
</span></b>
        <pre>No changes if I omit the console=fb0 and/or video= option.
Using a different resolution for video= sets the X11 screen accordingly,
though.

I also recall that I've added those two in an effort to get a working console.
But that obviously did not help.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1404072716.fe134E1.12742--

--===============1568676393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1568676393==--
