From: Lijo Antony <lijo.kernel@gmail.com>
Subject: Re: [Nouveau] nouveau lockdep splat
Date: Wed, 20 Mar 2013 10:35:09 +0400
Message-ID: <5149589D.6090403@gmail.com>
References: <20130304211608.GD22274@pd.tnic>  <1362501052.1933.2.camel@antimon> <20130319202432.GC4570@pd.tnic> <1363725620.3413.29.camel@thor.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1363725620.3413.29.camel@thor.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Hurley <peter@hurleysoftware.com>
Cc: Borislav Petkov <bp@alien8.de>, Ben Skeggs <bskeggs@redhat.com>, Lucas Stach <dev@lynxeye.de>, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Dave Airlie <airlied@linux.ie>
List-Id: nouveau.vger.kernel.org

On 03/20/2013 12:40 AM, Peter Hurley wrote:
>>
>> with the hope of having the right people on CC now (finally, thanks
>> Lucas :-)), here's the same splat on -rc3. Someone better take a look
>> soonish, please:
>
> Also happens in next (on nv50 hardware).

I think this is same as https://lkml.org/lkml/2013/3/16/143 (btw, git 
bisect in that mail is incorrect). While investigating, I found this 
issue was introduced during 3.9 merge window. For me this comes when I 
connect my TV via HDMI. But for a couple of tags during bisecting, I 
have seen the same during boot also.

-lijo
