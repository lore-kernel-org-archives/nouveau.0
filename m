From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77361] [nve7] nouveau not working on 3.13 linux
	kernel
Date: Sun, 13 Apr 2014 11:07:20 +0000
Message-ID: <bug-77361-8800-XL4sqTjTO9@http.bugs.freedesktop.org/>
References: <bug-77361-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2037497080=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77361-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2037497080==
Content-Type: multipart/alternative; boundary="1397387240.061ed7001.31060"; charset="us-ascii"


--1397387240.061ed7001.31060
Date: Sun, 13 Apr 2014 11:07:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77361

--- Comment #18 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Sam,

If you're certain that the only thing that changed is the kernel then kernel
bisection would our next step. The following command will start bisecting
between 3.12 (good) and 3.13 (bad), for commits touch nouveau.

$ git bisect v3.13 v3.12 -- drivers/gpu/drm/nouveau

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397387240.061ed7001.31060
Date: Sun, 13 Apr 2014 11:07:20 +0000
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
   title="NEW --- - [nve7] nouveau not working on 3.13 linux kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77361#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nve7] nouveau not working on 3.13 linux kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77361">bug 77361</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Hi Sam,

If you're certain that the only thing that changed is the kernel then kernel
bisection would our next step. The following command will start bisecting
between 3.12 (good) and 3.13 (bad), for commits touch nouveau.

$ git bisect v3.13 v3.12 -- drivers/gpu/drm/nouveau</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397387240.061ed7001.31060--

--===============2037497080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2037497080==--
