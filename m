From: Didier Spaier <didier.spaier-GqzDj6/B2j8@public.gmane.org>
Subject: Re: [Bug 30975] New: A Question about the linux-2.6
 kernel-modules for nouveau
Date: Tue, 19 Oct 2010 06:17:10 +0200
Message-ID: <4CBD1BC6.5090300@epsm.fr>
References: <bug-30975-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-30975-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

Le 19/10/2010 01:12, bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org a =E9crit :
> https://bugs.freedesktop.org/show_bug.cgi?id=3D30975
>
>             Summary: A Question about the linux-2.6 kernel-modules for
>                      nouveau
>             Product: xorg
>             Version: git
>            Platform: x86 (IA32)
>          OS/Version: Linux (All)
>              Status: NEW
>            Severity: trivial
>            Priority: medium
>           Component: Driver/nouveau
>          AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>          ReportedBy: STEVENWARD666-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
>           QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
>
>
> Hi to all,

Hi Steve,
>           I have a question about building my own custom kernel using the
> rpm-tools. I can build the kernel modules using the out-of-tree build aga=
inst
> my latest kernel from Fedora Rawhide with no problems. I have bult my own
> custom kernel using make xconfig,make clean, make modules, make
> modules_install,and finally, dracut -f /boot/initramfs<kernel version>.img
> <kernel version>
>
> My only bug-bear by doing the make modules method is that it took a total=
 of 5
> 1/2 hours with my Athlon XP 3,000 machine.So I looked at building the nou=
veau
> kernel faster using the rpm-tools methodHere is the link
> http://fedoraproject.org/wiki/PackageMaintainers/CreatingPackageHowTo
>
I am not sure that this has something to do with nouveau.

As far as I know the modules compilation time depend mainly on you CPU spee=
d and the number of modules you compile.

As my guess is you don't want to or can use a more recent CPU, you could "m=
ake localmodconfig" in order to minimize the numer of modules to be buit.

> I have built a skeleton spec file using rpm-spec, and filled in the detai=
ls
> from the kernel section of Fedora Koji,and the Fedora rpm-tools howto.
> http://fedoraproject.org/wiki/PackageMaintainers/CreatingPackageHowTo
>
> I've ran rpmlint -i linux-2.6.36-nouveau.i686.spec to test my spec file,b=
ut I
> keep getting this error:
>
> linux-2.6.36-nouveau.i686.spec: W: invalid-url Source0:
> /root/opt/linux-2.6/linux-2.6.36-nouveau.tar.gz
> The value should be a valid, public HTTP, HTTPS, or FTP URL.
>
> I've tried both url's for the linux-2.6 git repository,and also linus's u=
rl for
> the kernel,but I still keep getting the same error.
>
> I have attached the spec file I've been using to see where I've been going
> wrong.

I didn't receive the spec file with your email.
>
> Any help would be greatly appreciated.
>
> Regards,
>         STEVE555
>
Regards,

Didier
