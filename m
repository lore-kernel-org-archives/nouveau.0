From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76173] xbmc green screen with vdpau enabled
Date: Fri, 14 Mar 2014 14:59:49 +0000
Message-ID: <bug-76173-8800-b26Tm20KK0@http.bugs.freedesktop.org/>
References: <bug-76173-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1387375872=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76173-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1387375872==
Content-Type: multipart/alternative; boundary="1394809189.cbaE11F0.2214"; charset="us-ascii"


--1394809189.cbaE11F0.2214
Date: Fri, 14 Mar 2014 14:59:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76173

--- Comment #3 from Martin Bednar <serafean-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 95811
  --> https://bugs.freedesktop.org/attachment.cgi?id=95811&action=edit
xbmc stdout on first crash

I just installed mesa from git [Mesa 10.2.0-devel (git-f9901f1)] and while the
green display is gone, yet xbmc still crashes.

relevant dmesg output : 
Crash 1 : 
[106884.734647] nouveau E[xbmc.bin[31002]] multiple instances of buffer 10 on
validation list
[106884.734665] nouveau E[xbmc.bin[31002]] validate_init
[106884.734673] nouveau E[xbmc.bin[31002]] validate: -22
[106884.739268] nouveau E[xbmc.bin[31002]] multiple instances of buffer 10 on
validation list
[106884.739287] nouveau E[xbmc.bin[31002]] validate_init
[106884.739315] nouveau E[xbmc.bin[31002]] validate: -22

crash 2 : 
[107027.343245] nouveau E[  PGRAPH][0000:03:00.0] DATA_ERROR INVALID_BITFIELD
[107027.343270] nouveau E[  PGRAPH][0000:03:00.0]  DATA_ERROR
[107027.343290] nouveau E[  PGRAPH][0000:03:00.0] ch 5 [0x001f7f4000
xbmc.bin[31256]] subc 3 class 0x8397 mthd 0x1b0c data 0x00000004

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394809189.cbaE11F0.2214
Date: Fri, 14 Mar 2014 14:59:49 +0000
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
   title="NEW --- - xbmc green screen with vdpau enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76173#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - xbmc green screen with vdpau enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76173">bug 76173</a>
              from <span class="vcard"><a class="email" href="mailto:serafean&#64;gmail.com" title="Martin Bednar &lt;serafean&#64;gmail.com&gt;"> <span class="fn">Martin Bednar</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=95811" name="attach_95811" title="xbmc stdout on first crash">attachment 95811</a> <a href="attachment.cgi?id=95811&amp;action=edit" title="xbmc stdout on first crash">[details]</a></span>
xbmc stdout on first crash

I just installed mesa from git [Mesa 10.2.0-devel (git-f9901f1)] and while the
green display is gone, yet xbmc still crashes.

relevant dmesg output : 
Crash 1 : 
[106884.734647] nouveau E[xbmc.bin[31002]] multiple instances of buffer 10 on
validation list
[106884.734665] nouveau E[xbmc.bin[31002]] validate_init
[106884.734673] nouveau E[xbmc.bin[31002]] validate: -22
[106884.739268] nouveau E[xbmc.bin[31002]] multiple instances of buffer 10 on
validation list
[106884.739287] nouveau E[xbmc.bin[31002]] validate_init
[106884.739315] nouveau E[xbmc.bin[31002]] validate: -22

crash 2 : 
[107027.343245] nouveau E[  PGRAPH][0000:03:00.0] DATA_ERROR INVALID_BITFIELD
[107027.343270] nouveau E[  PGRAPH][0000:03:00.0]  DATA_ERROR
[107027.343290] nouveau E[  PGRAPH][0000:03:00.0] ch 5 [0x001f7f4000
xbmc.bin[31256]] subc 3 class 0x8397 mthd 0x1b0c data 0x00000004</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394809189.cbaE11F0.2214--

--===============1387375872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1387375872==--
