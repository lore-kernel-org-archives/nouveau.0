From: Keith Whitwell <keithw@vmware.com>
Subject: Re: [RFC] Merge of a reincarnation of the nouveau
 classic mesa driver.
Date: Tue, 02 Feb 2010 13:39:06 +0000
Message-ID: <1265117946.19378.5.camel@toffee>
References: <87k4uvvr3r.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa3d-dev-bounces@lists.sourceforge.net>
In-Reply-To: <87k4uvvr3r.fsf@riseup.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/mesa3d-dev>,
	<mailto:mesa3d-dev-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=mesa3d-dev>
List-Post: <mailto:mesa3d-dev@lists.sourceforge.net>
List-Help: <mailto:mesa3d-dev-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/mesa3d-dev>,
	<mailto:mesa3d-dev-request@lists.sourceforge.net?subject=subscribe>
Errors-To: mesa3d-dev-bounces@lists.sourceforge.net
To: Francisco Jerez <currojerez@riseup.net>
Cc: nouveau <nouveau@lists.freedesktop.org>, mesa3d-dev <mesa3d-dev@lists.sf.net>
List-Id: nouveau.vger.kernel.org

On Tue, 2010-02-02 at 03:01 -0800, Francisco Jerez wrote:
> For a long time the gallium pipe drivers for nvidia fixed function cards
> (nv0x, nv1x and, to some extent, nv2x) have remained unmaintained and
> godforsaken -- especially nv0x and nv1x had seen almost no progress
> since their creation.
> 
> They've recently grown a classic mesa driver which implements many new
> features: texturing, hardware-accelerated tnl. However the killer
> feature is "it actually draws stuff" (and if you're lucky even some
> simple games at reasonable FPS) so I don't like to consider this a step
> back.
> 
> Right now it is located in a git repo here [1], "mesa-next" is the
> branch I'm proposing to merge. I'll reply myself with the patches
> affecting core mesa it depends on, to give them more visibility. Of
> course driver-related comments are welcome too.
> 
> [1] http://cgit.freedesktop.org/~currojerez/mesa/

This looks like an appropriate path forward for this hardware.  Gallium
hides the things they need to be operating on, and Mesa's driver
interface is much closer to the requirements of this era of hardware.

Keith


------------------------------------------------------------------------------
The Planet: dedicated and managed hosting, cloud storage, colocation
Stay online with enterprise data centers and the best network in the business
Choose flexible plans and management services without long-term contracts
Personal 24x7 support from experience hosting pros just a phone call away.
http://p.sf.net/sfu/theplanet-com
