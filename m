From: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [Nouveau] [RFC 0/4] Implement full clockgating for Kepler1 and 2
Date: Wed, 17 Jan 2018 23:11:13 +0200
Message-ID: <703110bc-91c8-d872-7709-5dec7aa7c5b0@kapsi.fi>
References: <20180115220755.16780-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180115220755.16780-1-lyude@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org
Cc: Kate Stewart <kstewart@linuxfoundation.org>, David Airlie <airlied@linux.ie>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>, Philippe Ombredanne <pombredanne@nexb.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: nouveau.vger.kernel.org

On 01/16/2018 12:06 AM, Lyude Paul wrote:
> It's here! After a lot of investigation, rewrites, and traces, I present
> the patch series to implement all known levels of clockgating for
> Kepler1 and Kepler2 GPUs.
> 
> Starting with Fermi GPUs (this is probably present on earlier GPUs as
> well, but with a far less easy to manage interface), nvidia added two
> clockgating levels that are handled mostly in firmware (with the
> exception of course, of the driver initially programming all of the
> register values containing engine delays and that stuff):
>    - CG_CTRL - Main register for enabling/disabling clockgating for
>      engines and hw blocks
>    - BLCG - "Block-level clockgating", a deeper level of clockgating
> Starting with kepler2 as well, nvidia also introduced:
>    - SLCG - "??? clockgating" even deeper level of clockgating

FWIW, SLCG stands for "second level clock gating".

Cheers,
Mikko
