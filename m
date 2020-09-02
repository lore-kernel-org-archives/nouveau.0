From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 07/28] 53c700: improve non-coherent DMA handling
Date: Wed, 2 Sep 2020 17:00:51 +0200
Message-ID: <30bfa844-00ea-1abe-9022-d73cf309e580@gmx.de>
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-8-hch@lst.de>
 <1598971960.4238.5.camel@HansenPartnership.com>
 <20200901150554.GN14765@casper.infradead.org>
 <1598973776.4238.11.camel@HansenPartnership.com>
 <3369218e-eea4-14e9-15f1-870269e4649d@gmx.de>
 <77c9b2b6-bedc-d090-8b23-6ac664df1d1f@gmx.de>
 <20200901165311.GS14765@casper.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20200901165311.GS14765@casper.infradead.org>
Content-Language: en-US
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, James Bottomley <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Ben Skeggs <bskeggs@redhat.com>, Matt Porter <mporter@kernel.crashing.org>, linux-media@vger.kernel.org, Tom Lendacky <thomas.lendacky@amd.com>, Pawel Osciak <pawel@osciak.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>l
List-Id: nouveau.vger.kernel.org

Hi Willy,

On 01.09.20 18:53, Matthew Wilcox wrote:
> On Tue, Sep 01, 2020 at 06:41:12PM +0200, Helge Deller wrote:
>>> I still have a zoo of machines running for such testing, including a
>>> 715/64 and two 730.
>>> I'm going to test this git tree on the 715/64:
>
> The 715/64 is a 7100LC machine though.  I think you need to boot on
> the 730 to test the non-coherent path.

Just tested the 730, and it works as well.

Helge
