From: poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: VGA resume & thaw & boot (wake up from S3 & S4 & boot
 from S5) broken 3.18
Date: Tue, 21 Oct 2014 19:23:29 +0200
Message-ID: <54469691.10105@gmail.com>
References: <5444A802.9030504@gmail.com> <544562E9.1030000@gmail.com>
 <5445A78B.8050501@gmail.com> <5445AA57.3020801@gmail.com>
 <54463183.3010808@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <54463183.3010808-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Mailing-List fedora-kernel <kernel-TuqUDEhatI4ANWPb/1PvSmm0pvjS0E/A@public.gmane.org>
List-Id: nouveau.vger.kernel.org


- http://cgit.freedesktop.org/~airlied/linux/log/?h=drm-fixes
git clone -b drm-fixes git://people.freedesktop.org/~airlied/linux

- http://cgit.freedesktop.org/~darktama/nouveau/
git://people.freedesktop.org/~darktama/nouveau

./autogen.sh 
cd drm
make
su
mkdir /usr/lib/modules/3.18.0-rc1.git-e800cab-drm-fixes/updates/
cp nouveau.ko /usr/lib/modules/3.18.0-rc1.git-e800cab-drm-fixes/updates/
depmod 

The same situation as before, 
after "fb: switching to nouveaufb from VESA VGA", 
display is powered off


Good Night Princess
