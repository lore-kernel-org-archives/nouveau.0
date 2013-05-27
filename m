From: Michael Weirauch <michael.weirauch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: fdo-git build broken as of 2013-05-07?
Date: Mon, 27 May 2013 11:13:11 +0200
Message-ID: <CAMpzoDApPUugPCGA-W5UX2R-2TVS32vJZQCqcBwgGSXM0ABErg@mail.gmail.com>
References: <CAMpzoDACw2z26vNhZQ4T6WS3xqY+7xypOumJ-fTuLWwLDock2w@mail.gmail.com>
	<518A64F9.6090408@gmail.com>
	<CAMpzoDA3RYUbRpfZfzX4Lwukpw+YbRDseHSHMHcHC6f=RTXMaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAMpzoDA3RYUbRpfZfzX4Lwukpw+YbRDseHSHMHcHC6f=RTXMaQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

2013/5/14 Michael Weirauch <michael.weirauch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> Let's see if it is just my setup since reset to origin/master with
> 3.10-rc1 or another "silly \"breakage\"":
>
> $ make -j8 O=../generated-test/ binrpm-pkg
> [...]
>   BUILD   arch/x86/boot/bzImage
> Setup is 17164 bytes (padded to 17408 bytes).
> System is 4531 kB
> CRC c0c9904f
> Kernel: arch/x86/boot/bzImage is ready  (#3)
>   MODPOST 2477 modules
> /bin/sh /store/data/devel/openSUSE/nouveau/linux-2.6/scripts/package/mkspec
> prebuilt > /store/data/devel/openSUSE/nouveau/generated-test/binkernel.spec
> /bin/sh /store/data/devel/openSUSE/nouveau/linux-2.6/scripts/mkversion
>> /store/data/devel/openSUSE/nouveau/generated-test/.tmp_version
> mv -f /store/data/devel/openSUSE/nouveau/generated-test/.tmp_version
> /store/data/devel/openSUSE/nouveau/generated-test/.version
> rpmbuild  --define "_builddir
> /store/data/devel/openSUSE/nouveau/generated-test" --target \
> x86_64 -bb FORCE
> Building target platforms: x86_64
> Building for target x86_64
> error: failed to stat
> /store/data/devel/openSUSE/nouveau/generated-test/FORCE: Datei oder
> Verzeichnis nicht gefunden
> make[2]: *** [binrpm-pkg] Fehler 1
> make[1]: *** [binrpm-pkg] Fehler 2
> make: *** [sub-make] Fehler 2
>
> Can somebody reproduce?

FYI, build is back to normal with recent rebase on 3.10-rc2.

Michael
