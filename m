From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] Latest 4.6rc4 kernel, no booting on gtx970
Date: Tue, 09 Aug 2016 18:17:54 +0000
Message-ID: <bug-94990-8800-aRyNMRVxll@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0796856817=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94990-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0796856817==
Content-Type: multipart/alternative; boundary="14707666740.D0F6bC.8952";
 charset="UTF-8"


--14707666740.D0F6bC.8952
Date: Tue, 9 Aug 2016 18:17:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94990

--- Comment #54 from Efrem McCrimon <efremmc2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi QA:

 I had can to create the manual blacklist entry for nouveau.   I did this
because I wanted to use the non-free driver.  This is also required if you
want to use the Intel HD internal graphics card with a Nvidia chip set as a
secondary card.

The first edit will disable nouveau and verify by "lsmod | grep -i nouveau"



Manual edits required to get this working.

1. Created blacklist entry, /etc/modprobe.d/blacklist=C2=ADnouveau.conf as =
shown
below

# cat /etc/modprobe.d/blacklist=C2=ADnouveau.conf

blacklist nouveau

options nouveau modeset=3D0

2. kernel option used, nomodeset

Below (lines below) if you want to use the Nvidia non-free driver support:

3. Used Nvidia xconfig tool, nvidia=C2=ADxconfig

4. Edit the file manually to see what drivers were being used , it should
state: Drivers =E2=80=9Cnvidia=E2=80=9D

5. ** Special note, I have two separate video GPU cards and decided to use
individual heads, device1, device2


Now after booting, Nvidia drivers are working because the X server came up.
I noticed that

'num=C2=ADlock' was off. Verification of X is as follows:

1. Verify what is in proc, lsmod, dmesg messages

# cat /proc/driver/nvidia/version

NVRM version: NVIDIA UNIX x86_64 Kernel Module 352.30 Tue Jul 21 18:53:45
PDT 2015

GCC version: gcc version 4.8.3 20140106 (OpenMandriva Association) (Linaro
GCC 4.8=C2=AD2014.01)

This is the driver we wanted, 352.30, installed from 'mcc'; manual edits
required for the blacklist

file creation. The installation needs to create something. The Nvidia
installer does create a file for

you using their manual installation method by executing the driver
installation <Nvidia-
driver.version>.run.

2. Verify X log in /var/log/Xorg.0.log.

3. Run Nvidia settings and Nvidia System Management Interface tool,
nvidia=C2=ADsettings, a X tool,

and nvidia=C2=ADsmi, System Management interface tool

Nvidia=C2=ADsmi, reports the driver version match such as in
proc/driver/nvidia/version and reports the

GPU(s). GPU=C2=AD0, is the 960; GPU=C2=AD1, is the 730 card. I want to run =
the 960 as
the primary (a

physical connection to a 24in monitor).

# nvidia=C2=ADsmi

Sat Feb 27 04:26:53 2016

+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD+

| NVIDIA=C2=ADSMI 352.30 Driver Version: 352.30 |

|=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD+

| GPU Name Persistence=C2=ADM| Bus=C2=ADId Disp.A | Volatile Uncorr. ECC |

| Fan Temp Perf Pwr:Usage/Cap| Memory=C2=ADUsage | GPU=C2=ADUtil Compute M.=
 |

|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D|

| 0 GeForce GTX 960 Off | 0000:01:00.0 On | N/A |

| 0% 28C P8 7W / 128W | 216MiB / 4091MiB | 0% Default |

+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD+

| 1 GeForce GT 730 Off | 0000:02:00.0 N/A | N/A |

| 30% 28C P8 N/A / N/A | 66MiB / 1023MiB | N/A Default |

+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD+

+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD+

| Processes: GPU Memory |

| GPU PID Type Process name Usage |

|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D|

| 0 4619 G /etc/X11/X 200MiB |

| 0 6121 G /usr/bin/nvidia=C2=ADsettings 2MiB |

| 1 Not Supported |


Regards,

Efrem Mc

PS, I have used this in the past.  You can also try using "acpi_osi=3DLinux"
on the kernel command line.
This allows be to boot with the Nvidia card as a primary video source with
the Intel HD graphics card disabled in BIOS.

I have found that the BIOS is disabled and initfs still loads the i915
driver module


On Tue, Aug 9, 2016 at 12:00 PM, <bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> wrote:

> *Comment # 53 <https://bugs.freedesktop.org/show_bug.cgi?id=3D94990#c53> =
on
> bug 94990 <https://bugs.freedesktop.org/show_bug.cgi?id=3D94990> from Pie=
rre
> Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> *
>
> (In reply to Ilia Guterman from comment #52 <https://bugs.freedesktop.org=
/show_bug.cgi?id=3D94990#c52>)> i tested with 'nouveau.modeset=3D0' on kern=
el 4.5 and 4.6 on debian/sid and got
> > the same results of screen flickering and seems like nothing inside of =
the
> > nouveau driver getting called.
>
> Right, `nouveau.modeset=3D0` wont=E2=80=99t prevent Nouveau from loading,=
 however the
> driver is in a "disable" state and won=E2=80=99t do a thing:
> > modeset
> > Whether the driver should be enabled. 0 for disabled, 1 for enabled, 2 =
for headless
>
> (taken from the Nouveau wiki:https://nouveau.freedesktop.org/wiki/KernelM=
oduleParameters/#modeset)
>
> ------------------------------
> You are receiving this mail because:
>
>    - You are the assignee for the bug.
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>
>

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14707666740.D0F6bC.8952
Date: Tue, 9 Aug 2016 18:17:54 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990#c54">Commen=
t # 54</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990">bug 94990<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
efremmc2&#64;gmail.com" title=3D"Efrem McCrimon &lt;efremmc2&#64;gmail.com&=
gt;"> <span class=3D"fn">Efrem McCrimon</span></a>
</span></b>
        <pre>Hi QA:

 I had can to create the manual blacklist entry for nouveau.   I did this
because I wanted to use the non-free driver.  This is also required if you
want to use the Intel HD internal graphics card with a Nvidia chip set as a
secondary card.

The first edit will disable nouveau and verify by &quot;lsmod | grep -i nou=
veau&quot;



Manual edits required to get this working.

1. Created blacklist entry, /etc/modprobe.d/blacklist=C2=ADnouveau.conf as =
shown
below

# cat /etc/modprobe.d/blacklist=C2=ADnouveau.conf

blacklist nouveau

options nouveau modeset=3D0

2. kernel option used, nomodeset

Below (lines below) if you want to use the Nvidia non-free driver support:

3. Used Nvidia xconfig tool, nvidia=C2=ADxconfig

4. Edit the file manually to see what drivers were being used , it should
state: Drivers =E2=80=9Cnvidia=E2=80=9D

5. ** Special note, I have two separate video GPU cards and decided to use
individual heads, device1, device2


Now after booting, Nvidia drivers are working because the X server came up.
I noticed that

'num=C2=ADlock' was off. Verification of X is as follows:

1. Verify what is in proc, lsmod, dmesg messages

# cat /proc/driver/nvidia/version

NVRM version: NVIDIA UNIX x86_64 Kernel Module 352.30 Tue Jul 21 18:53:45
PDT 2015

GCC version: gcc version 4.8.3 20140106 (OpenMandriva Association) (Linaro
GCC 4.8=C2=AD2014.01)

This is the driver we wanted, 352.30, installed from 'mcc'; manual edits
required for the blacklist

file creation. The installation needs to create something. The Nvidia
installer does create a file for

you using their manual installation method by executing the driver
installation &lt;Nvidia-
driver.version&gt;.run.

2. Verify X log in /var/log/Xorg.0.log.

3. Run Nvidia settings and Nvidia System Management Interface tool,
nvidia=C2=ADsettings, a X tool,

and nvidia=C2=ADsmi, System Management interface tool

Nvidia=C2=ADsmi, reports the driver version match such as in
proc/driver/nvidia/version and reports the

GPU(s). GPU=C2=AD0, is the 960; GPU=C2=AD1, is the 730 card. I want to run =
the 960 as
the primary (a

physical connection to a 24in monitor).

# nvidia=C2=ADsmi

Sat Feb 27 04:26:53 2016

+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD+

| NVIDIA=C2=ADSMI 352.30 Driver Version: 352.30 |

|=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD+

| GPU Name Persistence=C2=ADM| Bus=C2=ADId Disp.A | Volatile Uncorr. ECC |

| Fan Temp Perf Pwr:Usage/Cap| Memory=C2=ADUsage | GPU=C2=ADUtil Compute M.=
 |

|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D|

| 0 GeForce GTX 960 Off | 0000:01:00.0 On | N/A |

| 0% 28C P8 7W / 128W | 216MiB / 4091MiB | 0% Default |

+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD+

| 1 GeForce GT 730 Off | 0000:02:00.0 N/A | N/A |

| 30% 28C P8 N/A / N/A | 66MiB / 1023MiB | N/A Default |

+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD+

+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD+

| Processes: GPU Memory |

| GPU PID Type Process name Usage |

|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D|

| 0 4619 G /etc/X11/X 200MiB |

| 0 6121 G /usr/bin/nvidia=C2=ADsettings 2MiB |

| 1 Not Supported |


Regards,

Efrem Mc

PS, I have used this in the past.  You can also try using &quot;acpi_osi=3D=
Linux&quot;
on the kernel command line.
This allows be to boot with the Nvidia card as a primary video source with
the Intel HD graphics card disabled in BIOS.

I have found that the BIOS is disabled and initfs still loads the i915
driver module


On Tue, Aug 9, 2016 at 12:00 PM, &lt;<a href=3D"mailto:bugzilla-daemon&#64;=
freedesktop.org">bugzilla-daemon&#64;freedesktop.org</a>&gt; wrote:

<span class=3D"quote">&gt; *<a href=3D"show_bug.cgi?id=3D94990#c53">Comment=
 # 53</a> &lt;<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"show_bug.cgi?id=3D94990#c53">https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D94990#c53</a>&gt; on
&gt; <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"show_bug.cgi?id=3D94990">bug 94990</a> &lt;<a class=3D"bz_bug_li=
nk=20
          bz_status_NEW "
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"show_bug.cgi?id=3D94990">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D94990</a>&gt; from Pierre
&gt; Moreau &lt;<a href=3D"mailto:pierre.morrow&#64;free.fr">pierre.morrow&=
#64;free.fr</a>&gt; *</span >
&gt;
<span class=3D"quote">&gt; (In reply to Ilia Guterman from <a href=3D"show_=
bug.cgi?id=3D94990#c52">comment #52</a> &lt;<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"show_bug.cgi?id=3D94990#c52">https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D94990#c52</a>&gt;)&gt; i tested with 'nouveau.modeset=3D0' on k=
ernel 4.5 and 4.6 on debian/sid and got
&gt; &gt; the same results of screen flickering and seems like nothing insi=
de of the
&gt; &gt; nouveau driver getting called.</span >
&gt;
<span class=3D"quote">&gt; Right, `nouveau.modeset=3D0` wont=E2=80=99t prev=
ent Nouveau from loading, however the
&gt; driver is in a &quot;disable&quot; state and won=E2=80=99t do a thing:
&gt; &gt; modeset
&gt; &gt; Whether the driver should be enabled. 0 for disabled, 1 for enabl=
ed, 2 for headless</span >
&gt;
<span class=3D"quote">&gt; (taken from the Nouveau wiki:<a href=3D"https://=
nouveau.freedesktop.org/wiki/KernelModuleParameters/#modeset">https://nouve=
au.freedesktop.org/wiki/KernelModuleParameters/#modeset</a>)</span >
&gt;
<span class=3D"quote">&gt; ------------------------------
&gt; You are receiving this mail because:</span >
&gt;
<span class=3D"quote">&gt;    - You are the assignee for the bug.</span >
&gt;
&gt;
<span class=3D"quote">&gt; _______________________________________________
&gt; Nouveau mailing list
&gt; <a href=3D"mailto:Nouveau&#64;lists.freedesktop.org">Nouveau&#64;lists=
.freedesktop.org</a>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau">htt=
ps://lists.freedesktop.org/mailman/listinfo/nouveau</a></span >
&gt;
&gt;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14707666740.D0F6bC.8952--

--===============0796856817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0796856817==--
