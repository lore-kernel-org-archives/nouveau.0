From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72180] [NVE6] Random GPU Lockups,
	works with blob PGRAPH fw
Date: Wed, 08 Jan 2014 20:34:21 +0000
Message-ID: <bug-72180-8800-A9wN7HiiQc@http.bugs.freedesktop.org/>
References: <bug-72180-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1390770573=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72180-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1390770573==
Content-Type: multipart/alternative; boundary="1389213261.7B3D55.23915"; charset="us-ascii"


--1389213261.7B3D55.23915
Date: Wed, 8 Jan 2014 20:34:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72180

--- Comment #25 from Brandon Bertelsen <brandon-h6AymINWW/kV+D8aMU/kSg@public.gmane.org> ---
I suffered from the same bug. I was able to fix it with some help from users on
IRC as well as the files presented here. Figured I'd provide explicit
instructions for others. (I'm using Ubuntu 13.10). 

1. First make sure you have NV6 firmware

$dmesg | grep nouveau | grep Chipset

You should see something that looks like: 

[    2.318701] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK106 (NVE6)

2. Download and move the files from Jordan Bass (thanks!) in comment 19

sudo mkdir /lib/firmware/nouveau
sudo /path/to/extractedfiles/* /lib/firmware/nouveau

3. Update initramfs

sudo update-initramfs -c -k <YOUR_KERNEL>

4. Update GRUB

sudo nano /etc/default/grub

Add nouveau.config=NvGrUseFW=1 to GRUB_CMDLINE_LINUX_DEFAULT so that it looks
like: 

GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nouveau.config=NvGrUseFW=1"

5. Update grub

sudo update-grub

6. Restart and verify

sudo shutdown -r now

On restart: 

$dmesg | grep external

[    2.484773] nouveau  [  PGRAPH][0000:01:00.0] using external firmware

If you see PGRAPH using external firmware, you're done.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389213261.7B3D55.23915
Date: Wed, 8 Jan 2014 20:34:21 +0000
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
   title="NEW --- - [NVE6] Random GPU Lockups, works with blob PGRAPH fw"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72180#c25">Comment # 25</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] Random GPU Lockups, works with blob PGRAPH fw"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72180">bug 72180</a>
              from <span class="vcard"><a class="email" href="mailto:brandon&#64;bertelsen.ca" title="Brandon Bertelsen &lt;brandon&#64;bertelsen.ca&gt;"> <span class="fn">Brandon Bertelsen</span></a>
</span></b>
        <pre>I suffered from the same bug. I was able to fix it with some help from users on
IRC as well as the files presented here. Figured I'd provide explicit
instructions for others. (I'm using Ubuntu 13.10). 

1. First make sure you have NV6 firmware

$dmesg | grep nouveau | grep Chipset

You should see something that looks like: 

[    2.318701] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK106 (NVE6)

2. Download and move the files from Jordan Bass (thanks!) in <a href="show_bug.cgi?id=72180#c19">comment 19</a>

sudo mkdir /lib/firmware/nouveau
sudo /path/to/extractedfiles/* /lib/firmware/nouveau

3. Update initramfs

sudo update-initramfs -c -k &lt;YOUR_KERNEL&gt;

4. Update GRUB

sudo nano /etc/default/grub

Add nouveau.config=NvGrUseFW=1 to GRUB_CMDLINE_LINUX_DEFAULT so that it looks
like: 

GRUB_CMDLINE_LINUX_DEFAULT=&quot;quiet splash nouveau.config=NvGrUseFW=1&quot;

5. Update grub

sudo update-grub

6. Restart and verify

sudo shutdown -r now

On restart: 

$dmesg | grep external

[    2.484773] nouveau  [  PGRAPH][0000:01:00.0] using external firmware

If you see PGRAPH using external firmware, you're done.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389213261.7B3D55.23915--

--===============1390770573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1390770573==--
