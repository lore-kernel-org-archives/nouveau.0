From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56202] [regression][kms] Clock rework causes kms
 boot regression for NV4E (v3.7-rc1, 3.6+nouveau)
Date: Sat, 20 Oct 2012 07:51:23 +0000
Message-ID: <bug-56202-8800-ZSaeRjctjD@http.bugs.freedesktop.org/>
References: <bug-56202-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1350452972=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56202-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1350452972==
Content-Type: multipart/alternative; boundary="1350719483.65Db1.16390"; charset="us-ascii"


--1350719483.65Db1.16390
Date: Sat, 20 Oct 2012 07:51:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56202

--- Comment #2 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I guess this just turned pretty obvious, I took another look at both the dmesg
output of both kernels.

Good kernel says:
+[drm] nouveau 0000:00:05.0: c:

Bad kernel says:
-[drm] nouveau 0000:00:05.0: c: core 24MHz

That is not a typo!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1350719483.65Db1.16390
Date: Sat, 20 Oct 2012 07:51:23 +0000
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
   title="NEW --- - [regression][kms] Clock rework causes kms boot regression for NV4E (v3.7-rc1, 3.6+nouveau)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56202#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression][kms] Clock rework causes kms boot regression for NV4E (v3.7-rc1, 3.6+nouveau)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56202">bug 56202</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>I guess this just turned pretty obvious, I took another look at both the dmesg
output of both kernels.

Good kernel says:
+[drm] nouveau 0000:00:05.0: c:

Bad kernel says:
-[drm] nouveau 0000:00:05.0: c: core 24MHz

That is not a typo!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1350719483.65Db1.16390--

--===============1350452972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1350452972==--
