From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: Re: [PATCH v2 4/4] drm/nouveau: gpu lockup recovery
Date: Wed, 25 Apr 2012 23:32:58 +0200
Message-ID: <20120425213258.GA13173@joi.lan>
References: <1335388836-13127-4-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1335388836-13127-4-git-send-email-marcin.slusarz@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Wed, Apr 25, 2012 at 11:20:36PM +0200, Marcin Slusarz wrote:
> Overall idea:
> Detect lockups by watching for timeouts (vm flush / fence), return -EIOs,
> handle them at ioctl level, reset the GPU and repeat last ioctl.
> 
> GPU reset is done by doing suspend / resume cycle with few tweaks:
> - CPU-only bo eviction
> - ignoring vm flush / fence timeouts
> - shortening waits
> 
> Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
> ---

What changed from v1:
- moved ioctl locking from drm core to nouveau
- made down_reads interruptible
- fixed build bug on 32-bit systems
