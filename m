From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 53219] ION: crash in nouveau_mm_head+0x37/0x170
 (regression of module rework)
Date: Sun, 11 Nov 2012 21:07:57 +0000
Message-ID: <bug-53219-8800-oAtZns4Pdf@http.bugs.freedesktop.org/>
References: <bug-53219-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1284561629=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-53219-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1284561629==
Content-Type: multipart/alternative; boundary="1352668077.EbBdC82.11098"; charset="us-ascii"


--1352668077.EbBdC82.11098
Date: Sun, 11 Nov 2012 21:07:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=53219

--- Comment #2 from Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I think this bug was recently fixed.

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=commit;h=5cad16acd25b16681a060d28d10eeacf98d07701
or
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=commit;h=a7dbf00433fa9dc6f4a3828a17d56a9df2bd06b1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1352668077.EbBdC82.11098
Date: Sun, 11 Nov 2012 21:07:57 +0000
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
   title="NEW --- - ION: crash in nouveau_mm_head+0x37/0x170 (regression of module rework)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=53219#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - ION: crash in nouveau_mm_head+0x37/0x170 (regression of module rework)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=53219">bug 53219</a>
              from <span class="vcard"><a class="email" href="mailto:marcin.slusarz&#64;gmail.com" title="Marcin Slusarz &lt;marcin.slusarz&#64;gmail.com&gt;"> <span class="fn">Marcin Slusarz</span></a>
</span></b>
        <pre>I think this bug was recently fixed.

<a href="http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=commit;h=5cad16acd25b16681a060d28d10eeacf98d07701">http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=commit;h=5cad16acd25b16681a060d28d10eeacf98d07701</a>
or
<a href="http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=commit;h=a7dbf00433fa9dc6f4a3828a17d56a9df2bd06b1">http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=commit;h=a7dbf00433fa9dc6f4a3828a17d56a9df2bd06b1</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1352668077.EbBdC82.11098--

--===============1284561629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1284561629==--
