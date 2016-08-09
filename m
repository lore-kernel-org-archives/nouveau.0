From: Efrem Mc <efremmc2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Bug 94990] Latest 4.6rc4 kernel, no booting on gtx970
Date: Tue, 9 Aug 2016 14:17:50 -0400
Message-ID: <CAEhOZrfupb89t=ecXvmXR1Ouu4OrgD6-Jwsggf0Tbo8DAe=Jeg@mail.gmail.com>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
 <bug-94990-8800-hbcZphsSyt@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1178017129=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94990-8800-hbcZphsSyt-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1178017129==
Content-Type: multipart/alternative; boundary=94eb2c05b31c0115250539a78d9a

--94eb2c05b31c0115250539a78d9a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

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

PS, I have used this in the past.  You can also try using "acpi_osi=3DLinux=
"
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

--94eb2c05b31c0115250539a78d9a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div>Hi QA:</div><div><div><br></div><div>=C2=A0I had =
can to create the manual blacklist entry for nouveau. =C2=A0 I did this bec=
ause I wanted to use the non-free driver.=C2=A0 This is also required if yo=
u want to use the Intel HD internal graphics card with a Nvidia chip set as=
 a secondary card.</div><div><br></div><div>The first edit will disable nou=
veau and verify by &quot;lsmod | grep -i nouveau&quot;</div><div><br></div>=
<div><br></div><div><br></div><div>Manual edits required to get this workin=
g.</div><div><br></div><div>1. Created blacklist entry, /etc/modprobe.d/bla=
cklist=C2=ADnouveau.conf as shown below</div><div><br></div><div># cat /etc=
/modprobe.d/blacklist=C2=ADnouveau.conf</div><div><br></div><div>blacklist =
nouveau</div><div><br></div><div>options nouveau modeset=3D0</div><div><br>=
</div><div>2. kernel option used, nomodeset</div><div><br></div><div>Below =
(lines below) if you want to use the Nvidia non-free driver support:</div><=
div><br></div><div>3. Used Nvidia xconfig tool, nvidia=C2=ADxconfig</div><d=
iv><br></div><div>4. Edit the file manually to see what drivers were being =
used , it should state: Drivers =E2=80=9Cnvidia=E2=80=9D</div><div><br></di=
v><div>5. ** Special note, I have two separate video GPU cards and decided =
to use individual heads, device1, device2</div><div><br></div><div><br></di=
v><div>Now after booting, Nvidia drivers are working because the X server c=
ame up. I noticed that</div><div><br></div><div>&#39;num=C2=ADlock&#39; was=
 off. Verification of X is as follows:</div><div><br></div><div>1. Verify w=
hat is in proc, lsmod, dmesg messages</div><div><br></div><div># cat /proc/=
driver/nvidia/version</div><div><br></div><div>NVRM version: NVIDIA UNIX x8=
6_64 Kernel Module 352.30 Tue Jul 21 18:53:45 PDT 2015</div><div><br></div>=
<div>GCC version: gcc version 4.8.3 20140106 (OpenMandriva Association) (Li=
naro GCC 4.8=C2=AD2014.01)</div><div><br></div><div>This is the driver we w=
anted, 352.30, installed from &#39;mcc&#39;; manual edits required for the =
blacklist</div><div><br></div><div>file creation. The installation needs to=
 create something. The Nvidia installer does create a file for</div><div><b=
r></div><div>you using their manual installation method by executing the dr=
iver installation &lt;Nvidia-</div><div>driver.version&gt;.run.</div><div><=
br></div><div>2. Verify X log in /var/log/Xorg.0.log.</div><div><br></div><=
div>3. Run Nvidia settings and Nvidia System Management Interface tool, nvi=
dia=C2=ADsettings, a X tool,</div><div><br></div><div>and nvidia=C2=ADsmi, =
System Management interface tool</div><div><br></div><div>Nvidia=C2=ADsmi, =
reports the driver version match such as in proc/driver/nvidia/version and =
reports the</div><div><br></div><div>GPU(s). GPU=C2=AD0, is the 960; GPU=C2=
=AD1, is the 730 card. I want to run the 960 as the primary (a</div><div><b=
r></div><div>physical connection to a 24in monitor).</div><div><br></div><d=
iv># nvidia=C2=ADsmi</div><div><br></div><div>Sat Feb 27 04:26:53 2016</div=
><div><br></div><div>+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD+</div><div><br></div><div>=
| NVIDIA=C2=ADSMI 352.30 Driver Version: 352.30 |</div><div><br></div><div>=
|=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD+</div><div><br></div><div>| GPU Name Persistence=C2=ADM| Bus=C2=
=ADId Disp.A | Volatile Uncorr. ECC |</div><div><br></div><div>| Fan Temp P=
erf Pwr:Usage/Cap| Memory=C2=ADUsage | GPU=C2=ADUtil Compute M. |</div><div=
><br></div><div>|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D|</div><div><br></div><div>| 0 GeFor=
ce GTX 960 Off | 0000:01:00.0 On | N/A |</div><div><br></div><div>| 0% 28C =
P8 7W / 128W | 216MiB / 4091MiB | 0% Default |</div><div><br></div><div>+=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD+</div><div><br></div><div>| 1 GeForce GT 730 Off | 0000:02:00.0 N/A =
| N/A |</div><div><br></div><div>| 30% 28C P8 N/A / N/A | 66MiB / 1023MiB |=
 N/A Default |</div><div><br></div><div>+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD+=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD+</div><div><br></div><div>=
+=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=
=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=AD=C2=
=AD=C2=AD=C2=AD+</div><div><br></div><div>| Processes: GPU Memory |</div><d=
iv><br></div><div>| GPU PID Type Process name Usage |</div><div><br></div><=
div>|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D|</div><div><br></div><div>| 0 4619 G /etc/X11/X 200MiB |</div><div><=
br></div><div>| 0 6121 G /usr/bin/nvidia=C2=ADsettings 2MiB |</div><div><br=
></div><div>| 1 Not Supported |</div></div><div><br></div><div><br></div><d=
iv>Regards,</div><div><br></div><div>Efrem Mc</div><div><br></div><div>PS, =
I have used this in the past.=C2=A0 You can also try using &quot;acpi_osi=
=3DLinux&quot; on the kernel command line.</div><div>This allows be to boot=
 with the Nvidia card as a primary video source with the Intel HD graphics =
card disabled in BIOS.</div><div><br></div><div>I have found that the BIOS =
is disabled and initfs still loads the i915 driver module</div><div><br></d=
iv></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, =
Aug 9, 2016 at 12:00 PM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:bugzilla-=
daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org" target=3D"_blank">bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
   =20
     =20
   =20
    <div>
      <p>
        </p><div>
            <b><a title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970=
" href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990#c53" target=
=3D"_blank">Comment # 53</a>
              on <a title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx9=
70" href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990" target=3D=
"_blank">bug 94990</a>
              from <span><a href=3D"mailto:pierre.morrow-GANU6spQydw@public.gmane.org" title=3D"=
Pierre Moreau &lt;pierre.morrow-GANU6spQydw@public.gmane.org&gt;" target=3D"_blank"> <span>Pierr=
e Moreau</span></a>
</span></b>
        <pre>(In reply to Ilia Guterman from <a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D94990#c52" target=3D"_blank">comment #52</a>)
<span class=3D""><span>&gt; i tested with &#39;nouveau.modeset=3D0&#39; on =
kernel 4.5 and 4.6 on debian/sid and got
&gt; the same results of screen flickering and seems like nothing inside of=
 the
&gt; nouveau driver getting called.</span></span>

Right, `nouveau.modeset=3D0` wont=E2=80=99t prevent Nouveau from loading, h=
owever the
driver is in a &quot;disable&quot; state and won=E2=80=99t do a thing:

<span>&gt; modeset
&gt; Whether the driver should be enabled. 0 for disabled, 1 for enabled, 2=
 for headless</span>

(taken from the Nouveau wiki:
<a href=3D"https://nouveau.freedesktop.org/wiki/KernelModuleParameters/#mod=
eset" target=3D"_blank">https://nouveau.freedesktop.<wbr>org/wiki/<wbr>Kern=
elModuleParameters/#<wbr>modeset</a>)</pre>
        </div>
      <p></p><span class=3D"">


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </span></div>
<br>______________________________<wbr>_________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/<wbr>mailman/lis=
tinfo/nouveau</a><br>
<br></blockquote></div><br></div>

--94eb2c05b31c0115250539a78d9a--

--===============1178017129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1178017129==--
