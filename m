From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56535] Resident evil 4 with wine: crash
Date: Fri, 02 Nov 2012 21:40:27 +0000
Message-ID: <bug-56535-8800-KfDTHeLdqM@http.bugs.freedesktop.org/>
References: <bug-56535-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1410491061=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56535-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1410491061==
Content-Type: multipart/alternative; boundary="1351892427.c2ACD1.12237"; charset="us-ascii"


--1351892427.c2ACD1.12237
Date: Fri, 2 Nov 2012 21:40:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56535

--- Comment #10 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
It's quite simple

1. Clone ABS [1]
2. Navigate to one of the mentioned components
3. Edit the accompanied PKGBUILD, appending "!strip" in the options array
4. (Optional), increment $pkgrel
5. Build and install the package
6. Repeat steps 2-5 for the other two packages

Enjoy

[1] https://wiki.archlinux.org/index.php/Arch_Build_System

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1351892427.c2ACD1.12237
Date: Fri, 2 Nov 2012 21:40:27 +0000
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
   title="NEW --- - Resident evil 4 with wine: crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56535#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Resident evil 4 with wine: crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56535">bug 56535</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>It's quite simple

1. Clone ABS [1]
2. Navigate to one of the mentioned components
3. Edit the accompanied PKGBUILD, appending &quot;!strip&quot; in the options array
4. (Optional), increment $pkgrel
5. Build and install the package
6. Repeat steps 2-5 for the other two packages

Enjoy

[1] <a href="https://wiki.archlinux.org/index.php/Arch_Build_System">https://wiki.archlinux.org/index.php/Arch_Build_System</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1351892427.c2ACD1.12237--

--===============1410491061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1410491061==--
