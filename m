From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: no start with latest modules from git
Date: Wed, 24 Feb 2010 12:41:59 +0100
Message-ID: <b67489df1002240341p7498486cu93704ae7bff7c3c7@mail.gmail.com>
References: <919223.18542.qm@web57008.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <919223.18542.qm-fMceGm5vvXiB9c0Qi4KiSs0jms80CZx+QQ4Iyu8u01E@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Sebastian Glita <glseba-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, Feb 24, 2010 at 11:02 AM, Sebastian Glita <glseba-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> wrote:
> Hello,
>
> Using code from git a week is since I cannot start Xorg with nouveau on a Quatro NVS 290.
>
> Commits from git.freedesktop.org:
>
> xorg-server - db4f676f25c6d8e58263d5151942be730592d444
> xf86-video-nouveau - 70d0a48b6c3f1a817bf850acd3bae48d063e56b9
> libdrm - 3130f94c6ee32668cb9f0b96b6c8e308a7bb3b11
> mesa - e16f0c14f353cc04ad6cbcf99e3b95ccb1d2c06b
>

And where is the kernel / nouveau drm ? This is probably even more
important than the rest :)
So upgrade it too with http://cgit.freedesktop.org/nouveau/linux-2.6/
