From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35267] nouveau fails to load BIOS on EFI boot.
Date: Thu, 05 Sep 2013 19:25:50 +0000
Message-ID: <bug-35267-8800-2g1rVadNlC@http.bugs.freedesktop.org/>
References: <bug-35267-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0023492419=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35267-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0023492419==
Content-Type: multipart/alternative; boundary="1378409150.24052a2.29674"; charset="us-ascii"


--1378409150.24052a2.29674
Date: Thu, 5 Sep 2013 19:25:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=35267

--- Comment #23 from hanfi <freedesktop.org-6Pg49yFQ+vvtRgLqZ5aouw@public.gmane.org> ---
(In reply to comment #22)
> Ooops, did I say nouveau.NvBios? (Yes, I did...) That was a lie.
> 
> Try: nouveau.config=NvBios=path/to/vbios.rom
> 
> Note that this path is passed to the firmware loader, which might only work
> in paths relative to /lib/firmware -- I don't think doing "/boot/blah" will
> work. But I've never tried it. (Or it'll call out to the usermode helper,
> which will do who knows what.)

Ok, I can load the driver now; No errors from the vbios loading.
I copied the vbios.rom into /lib/firmware and used
"modprobe nouveau config=NvBios=vbios.rom"

This worked fine on the console, I had some problems starting X, but I need
rebuild xorg and related stuff.

As this is not related to loading the vbios i think we can close this bug as a
proper way to load the vbios exists without need using Grub/bootloader.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378409150.24052a2.29674
Date: Thu, 5 Sep 2013 19:25:50 +0000
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
   title="NEW --- - nouveau fails to load BIOS on EFI boot."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=35267#c23">Comment # 23</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau fails to load BIOS on EFI boot."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=35267">bug 35267</a>
              from <span class="vcard"><a class="email" href="mailto:freedesktop.org&#64;spahan.ch" title="hanfi &lt;freedesktop.org&#64;spahan.ch&gt;"> <span class="fn">hanfi</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=35267#c22">comment #22</a>)
<span class="quote">&gt; Ooops, did I say nouveau.NvBios? (Yes, I did...) That was a lie.
&gt; 
&gt; Try: nouveau.config=NvBios=path/to/vbios.rom
&gt; 
&gt; Note that this path is passed to the firmware loader, which might only work
&gt; in paths relative to /lib/firmware -- I don't think doing &quot;/boot/blah&quot; will
&gt; work. But I've never tried it. (Or it'll call out to the usermode helper,
&gt; which will do who knows what.)</span >

Ok, I can load the driver now; No errors from the vbios loading.
I copied the vbios.rom into /lib/firmware and used
&quot;modprobe nouveau config=NvBios=vbios.rom&quot;

This worked fine on the console, I had some problems starting X, but I need
rebuild xorg and related stuff.

As this is not related to loading the vbios i think we can close this bug as a
proper way to load the vbios exists without need using Grub/bootloader.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378409150.24052a2.29674--

--===============0023492419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0023492419==--
