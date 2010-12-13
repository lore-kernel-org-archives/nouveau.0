From: Dave Airlie <airlied@gmail.com>
Subject: Re: [Nouveau] vga switcheroo not working / crashing the machine on
	i915/nvidia hybrid. (ASUS U30JC)
Date: Mon, 13 Dec 2010 11:09:58 +1000
Message-ID: <AANLkTimCDac1ZhcE2woxCkMCR2BP7oiTzcsgbb1Bjijb@mail.gmail.com>
References: <AANLkTimkHLNA_kYKp3P1Qyrass7puqGYzQi3LxQNNV5q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <AANLkTimkHLNA_kYKp3P1Qyrass7puqGYzQi3LxQNNV5q@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Giacomo <delleceste@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Sun, Dec 12, 2010 at 12:05 AM, Giacomo <delleceste@gmail.com> wrote:
> Hello.
>
> In my double-carded ASUS U30JC (nvidia + intel i915) I do the following:

You might want to try the branch in my drm-testing repo

http://git.kernel.org/?p=linux/kernel/git/airlied/drm-testing.git;a=shortlog;h=refs/heads/drm-nvidia-switch

Has much improvements for gpu switching on intel/nvidia.

Dave.
