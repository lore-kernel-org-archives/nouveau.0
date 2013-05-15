From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35267] nouveau fails to load BIOS on EFI boot.
Date: Wed, 15 May 2013 07:15:40 +0000
Message-ID: <bug-35267-8800-MwpPt8WLg2@http.bugs.freedesktop.org/>
References: <bug-35267-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1832076575=="
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


--===============1832076575==
Content-Type: multipart/alternative; boundary="1368602140.77ea3.10939"; charset="us-ascii"


--1368602140.77ea3.10939
Date: Wed, 15 May 2013 07:15:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=35267

--- Comment #15 from John <john.collaros-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi all,

I thought I might weigh in.

I am having some issues similar to what is mentioned here.
I was able to successfully boot my MacbookPro 4,1 from USB using EFI to install
Ubuntu 13.04.

I could only use the "Install Ubuntu" option from the Grub menu, and I had to
edit the kernel line adding "nouveau.blackliest=yes" before I could boot the
installer.

After installation I would get lockups. I had to pass the same parameter to the
linux boot line in grub again. Nouveau is still out for me. I tried a few
nVidia driver versions and I have gotten nvidia-173 to work. I just had to
apt-get Other versions give me the same 
NVRM: failed to copy vbios to system memory.
NVRM: RmInitAdapter failed! (0x30:0xffffffff:832)
NVRM: rm_init_adapter(0) failed

messages in my log, and a seemingly locked up system. I know its not locked up
because when I press the power button it spits some shutdown messages to the
screen and powers off.

I am also getting error messages in my X.org log about ACPI

[     5.804] (II) NVIDIA(0): Initialized GPU GART.
[     5.807] (WW) NVIDIA(0): Failed to determine power source of the system :
Un
able to
[     5.807] (WW) NVIDIA(0):     find AC state file under
/proc/acpi/ac_adapter/
[     5.816] (II) NVIDIA(0): Setting mode "nvidia-auto-select"
[     6.118] Loading extension NV-GLX

This might be why I have no brightness controls and being unable to suspend.
I can't work out if this is to do with the nVidia driver, or acpi.
the apple_bl module is loaded btw.

I don't know what it is about nvidia-173 that works, and none of the newer
versions available in the repos, nor the version in the ppa, nor the latest
version from the nvidia website work.

Hope this helps.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1368602140.77ea3.10939
Date: Wed, 15 May 2013 07:15:40 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=35267#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau fails to load BIOS on EFI boot."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=35267">bug 35267</a>
              from <span class="vcard"><a class="email" href="mailto:john.collaros&#64;gmail.com" title="John &lt;john.collaros&#64;gmail.com&gt;"> <span class="fn">John</span></a>
</span></b>
        <pre>Hi all,

I thought I might weigh in.

I am having some issues similar to what is mentioned here.
I was able to successfully boot my MacbookPro 4,1 from USB using EFI to install
Ubuntu 13.04.

I could only use the &quot;Install Ubuntu&quot; option from the Grub menu, and I had to
edit the kernel line adding &quot;nouveau.blackliest=yes&quot; before I could boot the
installer.

After installation I would get lockups. I had to pass the same parameter to the
linux boot line in grub again. Nouveau is still out for me. I tried a few
nVidia driver versions and I have gotten nvidia-173 to work. I just had to
apt-get Other versions give me the same 
NVRM: failed to copy vbios to system memory.
NVRM: RmInitAdapter failed! (0x30:0xffffffff:832)
NVRM: rm_init_adapter(0) failed

messages in my log, and a seemingly locked up system. I know its not locked up
because when I press the power button it spits some shutdown messages to the
screen and powers off.

I am also getting error messages in my X.org log about ACPI

[     5.804] (II) NVIDIA(0): Initialized GPU GART.
[     5.807] (WW) NVIDIA(0): Failed to determine power source of the system :
Un
able to
[     5.807] (WW) NVIDIA(0):     find AC state file under
/proc/acpi/ac_adapter/
[     5.816] (II) NVIDIA(0): Setting mode &quot;nvidia-auto-select&quot;
[     6.118] Loading extension NV-GLX

This might be why I have no brightness controls and being unable to suspend.
I can't work out if this is to do with the nVidia driver, or acpi.
the apple_bl module is loaded btw.

I don't know what it is about nvidia-173 that works, and none of the newer
versions available in the repos, nor the version in the ppa, nor the latest
version from the nvidia website work.

Hope this helps.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1368602140.77ea3.10939--

--===============1832076575==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1832076575==--
