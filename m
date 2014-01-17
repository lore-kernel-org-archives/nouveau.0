From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73473] Potential crash bug in
 src/gallium/auxiliary/rtasm/rtasm_execmem.c
Date: Fri, 17 Jan 2014 19:21:04 +0000
Message-ID: <bug-73473-8800-A2r2vUXhjW@http.bugs.freedesktop.org/>
References: <bug-73473-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1124118982=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73473-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1124118982==
Content-Type: multipart/alternative; boundary="1389986464.ba760a1.24419"; charset="us-ascii"


--1389986464.ba760a1.24419
Date: Fri, 17 Jan 2014 19:21:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73473

--- Comment #8 from Amadeusz <amade-dvG7DYx+7LWsTnJN9+BGXg@public.gmane.org> ---
Created attachment 92300
  --> https://bugs.freedesktop.org/attachment.cgi?id=92300&action=edit
patch adding check for PaX mprotect

As I said on #gentoo-hardened channel, I wouldn't like to see the SELinux part
of this patch to be merged. Provided SELinux check effectively requires
allowing all applications to be allowed access to write|exec memory regardless
of if it is needed or not.

I tested patch without the SELinux part and it worked fine on my PaX & SELinux
enabled system. Starting glxgears didn't bring down whole X server as was the
case before applying patch ;) .


If one wants to avoid "grsec: denied RWX mmap" messages probably something
along the lines of patch I attached (based on checks from the SELinux one and
http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/libffi/files/libffi-3.0.13-emutramp_pax_proc.patch?revision=1.2&view=markup)
would be needed.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389986464.ba760a1.24419
Date: Fri, 17 Jan 2014 19:21:04 +0000
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
   title="NEW --- - Potential crash bug in src/gallium/auxiliary/rtasm/rtasm_execmem.c"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73473#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Potential crash bug in src/gallium/auxiliary/rtasm/rtasm_execmem.c"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73473">bug 73473</a>
              from <span class="vcard"><a class="email" href="mailto:amade&#64;asmblr.net" title="Amadeusz &lt;amade&#64;asmblr.net&gt;"> <span class="fn">Amadeusz</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=92300" name="attach_92300" title="patch adding check for PaX mprotect">attachment 92300</a> <a href="attachment.cgi?id=92300&amp;action=edit" title="patch adding check for PaX mprotect">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=73473&amp;attachment=92300'>[review]</a>
patch adding check for PaX mprotect

As I said on #gentoo-hardened channel, I wouldn't like to see the SELinux part
of this patch to be merged. Provided SELinux check effectively requires
allowing all applications to be allowed access to write|exec memory regardless
of if it is needed or not.

I tested patch without the SELinux part and it worked fine on my PaX &amp; SELinux
enabled system. Starting glxgears didn't bring down whole X server as was the
case before applying patch ;) .


If one wants to avoid &quot;grsec: denied RWX mmap&quot; messages probably something
along the lines of patch I attached (based on checks from the SELinux one and
<a href="http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/libffi/files/libffi-3.0.13-emutramp_pax_proc.patch?revision=1.2&amp;view=markup">http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/libffi/files/libffi-3.0.13-emutramp_pax_proc.patch?revision=1.2&amp;view=markup</a>)
would be needed.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389986464.ba760a1.24419--

--===============1124118982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1124118982==--
