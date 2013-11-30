From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72181] [v3.13][regression] NULL pointer deref
 (_nouveau_clock_init)
Date: Sat, 30 Nov 2013 18:30:09 +0000
Message-ID: <bug-72181-8800-XNCv1M9aAA@http.bugs.freedesktop.org/>
References: <bug-72181-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0909446778=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72181-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0909446778==
Content-Type: multipart/alternative; boundary="1385836209.a4fB8C2.31451"; charset="us-ascii"


--1385836209.a4fB8C2.31451
Date: Sat, 30 Nov 2013 18:30:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72181

--- Comment #1 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Give this bad boy a try, it should resolve the problem

http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=0397aaaa009092427dc60aea8b3c21c00526d8ba

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385836209.a4fB8C2.31451
Date: Sat, 30 Nov 2013 18:30:09 +0000
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
   title="NEW --- - [v3.13][regression] NULL pointer deref (_nouveau_clock_init)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72181#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [v3.13][regression] NULL pointer deref (_nouveau_clock_init)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72181">bug 72181</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Give this bad boy a try, it should resolve the problem

<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=0397aaaa009092427dc60aea8b3c21c00526d8ba">http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=0397aaaa009092427dc60aea8b3c21c00526d8ba</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385836209.a4fB8C2.31451--

--===============0909446778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0909446778==--
