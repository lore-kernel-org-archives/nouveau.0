From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78530] Memory corruption on Lenovo t440p with runpm
Date: Tue, 02 Sep 2014 11:34:20 +0000
Message-ID: <bug-78530-8800-ve3MYDXqu4@http.bugs.freedesktop.org/>
References: <bug-78530-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0072122698=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78530-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0072122698==
Content-Type: multipart/alternative; boundary="1409657660.5C2022.1226"; charset="us-ascii"


--1409657660.5C2022.1226
Date: Tue, 2 Sep 2014 11:34:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78530

--- Comment #12 from Dmitry Nezhevenko <dion-OaY5VPdsfhrsG83rWm+8vg@public.gmane.org> ---
Hi,

I also have affected T440p machine that corrupts everything once runtime PM is
enabled or after calling ACPI method to resume card.

It was stated in bumblebee github thread, that adding "memmap=99G$0x100000000"
to kernel fixes issues on affected systems. 

My case looks a bit interesting because I have only 4GB of RAM right now, so
disabling everything above 4GB should not change behavior. But it changes!
Adding memmap= magic fixes issue for me. 

I've tried to compare /proc/iomem with and without boot options and found one
difference. Once booted with memmap=99G$0x100000000 I'm getting one large
reserved region:

   bceff000-18ffffffff : reserved
     bda00000-bf9fffff : Graphics Stolen Memory
     bfa00000-febfffff : PCI Bus 0000:00
       c0000000-d1ffffff : PCI Bus 0000:02
         c0000000-cfffffff : 0000:02:00.0
         d0000000-d1ffffff : 0000:02:00.0
       e0000000-efffffff : 0000:00:02.0
     ...

All PCI devices are inside this one large region. But if I boot with default
options, iomem is different:

   bceff000-bf9fffff : reserved
     bda00000-bf9fffff : Graphics Stolen Memory
   bfa00000-febfffff : PCI Bus 0000:00
     c0000000-d1ffffff : PCI Bus 0000:02
       c0000000-cfffffff : 0000:02:00.0
       d0000000-d1ffffff : 0000:02:00.0
     e0000000-efffffff : 0000:00:02.0
     f0000000-f0ffffff : PCI Bus 0000:02
       f0000000-f0ffffff : 0000:02:00.0
     f1000000-f13fffff : 0000:00:02.0
     f1400000-f14fffff : PCI Bus 0000:04

So now this reserved region starting at bceff000 covers all PCI devices.

[ I'm attaching both iomap files ]

To check this I've tried to explicitly reserve whole region by booting with
memmap=1100M$0xbfa00000 parameter. And got pretty similar to mem"map=99G"
iomap. But system still crashes after runtime pm.

I also was able to capture PCI configuration space for NVIDIA card from Win8
(where everything works). So I can confirm that after acpi_call windows also
shows just 0xFF bytes. But once resumed, it's a bit different from linux. Both
files attached.

Any ideas? Maybe card is somehow misconfigured?

Thanks

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409657660.5C2022.1226
Date: Tue, 2 Sep 2014 11:34:20 +0000
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
   title="REOPENED --- - Memory corruption on Lenovo t440p with runpm"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78530#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - Memory corruption on Lenovo t440p with runpm"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78530">bug 78530</a>
              from <span class="vcard"><a class="email" href="mailto:dion&#64;dion.org.ua" title="Dmitry Nezhevenko &lt;dion&#64;dion.org.ua&gt;"> <span class="fn">Dmitry Nezhevenko</span></a>
</span></b>
        <pre>Hi,

I also have affected T440p machine that corrupts everything once runtime PM is
enabled or after calling ACPI method to resume card.

It was stated in bumblebee github thread, that adding &quot;memmap=99G$0x100000000&quot;
to kernel fixes issues on affected systems. 

My case looks a bit interesting because I have only 4GB of RAM right now, so
disabling everything above 4GB should not change behavior. But it changes!
Adding memmap= magic fixes issue for me. 

I've tried to compare /proc/iomem with and without boot options and found one
difference. Once booted with memmap=99G$0x100000000 I'm getting one large
reserved region:

   bceff000-18ffffffff : reserved
     bda00000-bf9fffff : Graphics Stolen Memory
     bfa00000-febfffff : PCI Bus 0000:00
       c0000000-d1ffffff : PCI Bus 0000:02
         c0000000-cfffffff : 0000:02:00.0
         d0000000-d1ffffff : 0000:02:00.0
       e0000000-efffffff : 0000:00:02.0
     ...

All PCI devices are inside this one large region. But if I boot with default
options, iomem is different:

   bceff000-bf9fffff : reserved
     bda00000-bf9fffff : Graphics Stolen Memory
   bfa00000-febfffff : PCI Bus 0000:00
     c0000000-d1ffffff : PCI Bus 0000:02
       c0000000-cfffffff : 0000:02:00.0
       d0000000-d1ffffff : 0000:02:00.0
     e0000000-efffffff : 0000:00:02.0
     f0000000-f0ffffff : PCI Bus 0000:02
       f0000000-f0ffffff : 0000:02:00.0
     f1000000-f13fffff : 0000:00:02.0
     f1400000-f14fffff : PCI Bus 0000:04

So now this reserved region starting at bceff000 covers all PCI devices.

[ I'm attaching both iomap files ]

To check this I've tried to explicitly reserve whole region by booting with
memmap=1100M$0xbfa00000 parameter. And got pretty similar to mem&quot;map=99G&quot;
iomap. But system still crashes after runtime pm.

I also was able to capture PCI configuration space for NVIDIA card from Win8
(where everything works). So I can confirm that after acpi_call windows also
shows just 0xFF bytes. But once resumed, it's a bit different from linux. Both
files attached.

Any ideas? Maybe card is somehow misconfigured?

Thanks</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409657660.5C2022.1226--

--===============0072122698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0072122698==--
