From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: Re: [PATCHv2] kmmio/mmiotrace: fix double free of kmmio_fault_pages
Date: Mon, 14 Jun 2010 00:18:03 +0200
Message-ID: <20100613221803.GB3829@joi.lan>
References: <20100613215654.GA3829@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100613215654.GA3829@joi.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: x86@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Pekka Paalanen <pq@iki.fi>, Stuart Bennett <stuart@freedesktop.org>, Marcin =?utf-8?Q?Ko=C5=9Bcielnicki?= <koriakin@0x04.net>, Shinpei KATO <shinpei@il.is.s.u-tokyo.ac.jp>, nouveau@lists.freedesktop.org, Ingo Molnar <mingo@elte.hu>
List-Id: nouveau.vger.kernel.org

On Sun, Jun 13, 2010 at 11:56:54PM +0200, Marcin Slusarz wrote:
> After every iounmap mmiotrace has to free kmmio_fault_pages, but it
> can't do it directly, so it defers freeing by RCU.
>=20
> It usually works, but when mmiotraced code calls ioremap-iounmap
> multiple times without sleeping between (so RCU won't kick in and
> start freeing) it can be given the same virtual address, so at
> every iounmap mmiotrace will schedule the same pages for release.
> Obviously it will explode on second free.
>=20
> Fix it by marking kmmio_fault_pages which are scheduled for release
> and not adding them second time.
>=20
> Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
> Acked-by: Pekka Paalanen <pq@iki.fi>
> Cc: Stuart Bennett <stuart@freedesktop.org>
> Tested-by: Marcin Ko=C5=9Bcielnicki <koriakin@0x04.net>
> Tested-by: Shinpei KATO <shinpei@il.is.s.u-tokyo.ac.jp>
> ---

It would be good to apply it to -stable too. Sometimes people has to te=
st
some earlier kernels because of unfixable constraints (you know, these
uncooperative vendors not releasing their binary drivers for latest ker=
nels)

Marcin
