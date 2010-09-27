From: Dmitri Sosnik <dimavs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [drm] failed to open device
Date: Mon, 27 Sep 2010 15:35:07 +1000
Message-ID: <AANLkTim1Qp9Wd_P=rQEKh3Mp8zukPLwqkrg-nY7u3SU2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

Hi All,

I am trying to get nouveau working on MacBookPro 4,1. I am using
kernel from nouveau/linux-2.6 repository, XOrg 1.9, libdrm and
xf86-video-nouveau from git repositories.
When drm module is loaded with debug=1 it gives a number of "[drm:
drm_stub_open]," lines in logs. It looks like idr_find(...) function
returns 0. /dev/dri/card0 doesn't exist.

What I am doing wrong?

Cheers,
D
