From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62914] ZaphodHeads doesn't work after upgrading to
	xorg 1.14
Date: Fri, 31 May 2013 04:53:15 +0000
Message-ID: <bug-62914-8800-KHOAjap3PY@http.bugs.freedesktop.org/>
References: <bug-62914-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1298849767=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-62914-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1298849767==
Content-Type: multipart/alternative; boundary="1369975995.FFCddB1.3491"; charset="us-ascii"


--1369975995.FFCddB1.3491
Date: Fri, 31 May 2013 04:53:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62914

--- Comment #25 from Jason Stubbs <jasonbstubbs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 80079
  --> https://bugs.freedesktop.org/attachment.cgi?id=80079&action=edit
Disassembly of drmmode_set_mode_major

This is taken running rev 1fdd7db94b55c65ea62cc9eaefff620b20e9e4ea

The segfault happens in:

349             if (crtc->randr_crtc->scanout_pixmap)
   0x00000000000263e2 <+498>:   mov    0x1b8(%rbp),%rax
   0x00000000000263e9 <+505>:   xor    %ecx,%ecx
   0x00000000000263eb <+507>:   xor    %r8d,%r8d
   0x00000000000263f7 <+519>:   cmpq   $0x0,0x2d0(%rax)
   0x00000000000263ff <+527>:   je     0x264f0 <drmmode_set_mode_major+768>

350                     x = y = 0;


HEAD with the patch reverted and #ifdef'd chunks removed succeeds, but patch
reverted and #ifdef'd chunks kept (and a func declaration added) failed.
Testing a pristine HEAD with the #ifdef'd chunks removed also succeeds.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1369975995.FFCddB1.3491
Date: Fri, 31 May 2013 04:53:15 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - ZaphodHeads doesn't work after upgrading to xorg 1.14"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62914#c25">Comment # 25</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - ZaphodHeads doesn't work after upgrading to xorg 1.14"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62914">bug 62914</a>
              from <span class="vcard"><a class="email" href="mailto:jasonbstubbs&#64;gmail.com" title="Jason Stubbs &lt;jasonbstubbs&#64;gmail.com&gt;"> <span class="fn">Jason Stubbs</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=80079" name="attach_80079" title="Disassembly of drmmode_set_mode_major">attachment 80079</a> <a href="attachment.cgi?id=80079&amp;action=edit" title="Disassembly of drmmode_set_mode_major">[details]</a></span>
Disassembly of drmmode_set_mode_major

This is taken running rev 1fdd7db94b55c65ea62cc9eaefff620b20e9e4ea

The segfault happens in:

349             if (crtc-&gt;randr_crtc-&gt;scanout_pixmap)
   0x00000000000263e2 &lt;+498&gt;:   mov    0x1b8(%rbp),%rax
   0x00000000000263e9 &lt;+505&gt;:   xor    %ecx,%ecx
   0x00000000000263eb &lt;+507&gt;:   xor    %r8d,%r8d
   0x00000000000263f7 &lt;+519&gt;:   cmpq   $0x0,0x2d0(%rax)
   0x00000000000263ff &lt;+527&gt;:   je     0x264f0 &lt;drmmode_set_mode_major+768&gt;

350                     x = y = 0;


HEAD with the patch reverted and #ifdef'd chunks removed succeeds, but patch
reverted and #ifdef'd chunks kept (and a func declaration added) failed.
Testing a pristine HEAD with the #ifdef'd chunks removed also succeeds.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1369975995.FFCddB1.3491--

--===============1298849767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1298849767==--
