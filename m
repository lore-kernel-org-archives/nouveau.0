From: Lijo Antony <lijo.kernel@gmail.com>
Subject: Re: [Nouveau] nouveau lockdep splat
Date: Sun, 24 Mar 2013 22:00:55 +0400
Message-ID: <514F3F57.5080407@gmail.com>
References: <20130304211608.GD22274@pd.tnic> <1362501052.1933.2.camel@antimon>
	<20130319202432.GC4570@pd.tnic> <1363725620.3413.29.camel@thor.lan>
	<5149589D.6090403@gmail.com> <5149D467.7030908@gmail.com>
	<20130320152948.GD15471@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <20130320152948.GD15471@pd.tnic>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Borislav Petkov <bp@alien8.de>, Peter Hurley <peter@hurleysoftware.com>, Ben Skeggs <bskeggs@redhat.com>, Lucas Stach <dev@lynxeye.de>, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Dave Airlie <airlied@linux.ie>
List-Id: nouveau.vger.kernel.org

On 03/20/2013 07:29 PM, Borislav Petkov wrote:
> On Wed, Mar 20, 2013 at 07:23:19PM +0400, Lijo Antony wrote:
>> # bad: [fffddfd6c8e0c10c42c6e2cc54ba880fcc36ebbb] Merge branch
>> 'drm-next' of git://people.freedesktop.org/~airlied/linux
>> git bisect bad fffddfd6c8e0c10c42c6e2cc54ba880fcc36ebbb
>
> This is a merge commit which means something went wrong along the way of
> the bisection.
>

Looks like this has been fixed in -rc4.

-lijo
