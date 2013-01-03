From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: Re: Resume regression with nouveau 3.8rc1 (bisected)
Date: Thu, 3 Jan 2013 20:12:01 +0100
Message-ID: <20130103191201.GA25680@joi.lan>
References: <50E45007.5080706@gmail.com>
 <20130103125810.GA3198@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20130103125810.GA3198@joi.lan>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Pontus Fuchs <pontus.fuchs@gmail.com>
Cc: nouveau@lists.freedesktop.org, bskeggs@redhat.com, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Thu, Jan 03, 2013 at 01:58:10PM +0100, Marcin Slusarz wrote:
> On Wed, Jan 02, 2013 at 04:19:35PM +0100, Pontus Fuchs wrote:
> > Hi,
> > 
> > Starting with 3.8rc1 I get a black screen when resuming after suspend. 
> > The kernel is alive because I can switch to VT1 and reboot with 
> > ctrl-alt-delete.
> > 
> > I bisected the problem down to this commit:
> > 
> > 186ecad21: drm/nv50/disp: move remaining interrupt handling into core
> > 
> > Hardware is 8400M GS (10de:0427) in a Dell XPS M1330.
> 
> There's already open bug report for that:
> https://bugs.freedesktop.org/show_bug.cgi?id=58729

Yay, a bug fix was just posted there ;).

Marcin
