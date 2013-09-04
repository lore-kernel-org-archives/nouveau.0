From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35267] nouveau fails to load BIOS on EFI boot.
Date: Wed, 04 Sep 2013 20:16:11 +0000
Message-ID: <bug-35267-8800-J75BBumKX2@http.bugs.freedesktop.org/>
References: <bug-35267-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0513876459=="
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


--===============0513876459==
Content-Type: multipart/alternative; boundary="1378325771.bAfCb2.15299"; charset="us-ascii"


--1378325771.bAfCb2.15299
Date: Wed, 4 Sep 2013 20:16:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=35267

--- Comment #21 from hanfi <freedesktop.org-6Pg49yFQ+vvtRgLqZ5aouw@public.gmane.org> ---
(In reply to comment #20)
> Is this still an issue with the latest kernel? Note that you can load a
> custom vbios by using nouveau.NvBios=path/to/vbios.rom (which will be loaded
> using the firmware loading logic, so make sure that file is available when
> nouveau is getting loaded, either built into the kernel, or in the initrd if
> you're using that).

Where exactly should I set this option?
I tried pass it as a kernel parameter from grub, which did not work.
Then i blacklisted nouveau, and tried to load it after the system booted
But this always tells me:

laptop ~ # modprobe nouveau nouveau.NvBios='/boot/vbios.rom'
[   86.004292] nouveau: `/boot/vbios.rom' invalid for parameter
`nouveau.NvBios'
modprobe: ERROR: could not insert 'nouveau': Invalid argument
laptop ~ # modprobe nouveau NvBios='/boot/vbios.rom'
[   92.214318] nouveau: `/boot/vbios.rom' invalid for parameter `NvBios'
modprobe: ERROR: could not insert 'nouveau': Invalid argument


This is on kernel 3.10.7 (gentoo sources) and greping trough the source i see
that the option exists.
Do i need try linux for workgroup (aka 3.11)?

Im lost a little bit here.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378325771.bAfCb2.15299
Date: Wed, 4 Sep 2013 20:16:11 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=35267#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau fails to load BIOS on EFI boot."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=35267">bug 35267</a>
              from <span class="vcard"><a class="email" href="mailto:freedesktop.org&#64;spahan.ch" title="hanfi &lt;freedesktop.org&#64;spahan.ch&gt;"> <span class="fn">hanfi</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=35267#c20">comment #20</a>)
<span class="quote">&gt; Is this still an issue with the latest kernel? Note that you can load a
&gt; custom vbios by using nouveau.NvBios=path/to/vbios.rom (which will be loaded
&gt; using the firmware loading logic, so make sure that file is available when
&gt; nouveau is getting loaded, either built into the kernel, or in the initrd if
&gt; you're using that).</span >

Where exactly should I set this option?
I tried pass it as a kernel parameter from grub, which did not work.
Then i blacklisted nouveau, and tried to load it after the system booted
But this always tells me:

laptop ~ # modprobe nouveau nouveau.NvBios='/boot/vbios.rom'
[   86.004292] nouveau: `/boot/vbios.rom' invalid for parameter
`nouveau.NvBios'
modprobe: ERROR: could not insert 'nouveau': Invalid argument
laptop ~ # modprobe nouveau NvBios='/boot/vbios.rom'
[   92.214318] nouveau: `/boot/vbios.rom' invalid for parameter `NvBios'
modprobe: ERROR: could not insert 'nouveau': Invalid argument


This is on kernel 3.10.7 (gentoo sources) and greping trough the source i see
that the option exists.
Do i need try linux for workgroup (aka 3.11)?

Im lost a little bit here.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378325771.bAfCb2.15299--

--===============0513876459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0513876459==--
