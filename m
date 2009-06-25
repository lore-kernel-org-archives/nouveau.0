From: =?UTF-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas-4+hqylr40dJg9hUCZPvPmw@public.gmane.org>
Subject: Re: Why was old TTM removed from drm.git?
Date: Thu, 25 Jun 2009 10:55:58 +0200
Message-ID: <4A433B9E.10103@shipmail.org>
References: <20090624194306.0730cb2f@daedalus.pq.iki.fi>	
	<4A4261D1.8070204@shipmail.org>
	<1245911291.20064.3828.camel@thor.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------000705050609020507030501"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1245911291.20064.3828.camel-2h6evNeVVYGs1BDpvl8NfQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: =?UTF-8?B?TWljaGVsIETDpG56ZXI=?= <michel-otUistvHUpPR7s880joybQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, dri-devel-TtF/mJH4Jtrk1uMJSBkQmQ@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------000705050609020507030501
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Michel D=C3=A4nzer skrev:
> On Wed, 2009-06-24 at 19:26 +0200, Thomas Hellstr=C3=B6m wrote:
>  =20
>> Just prior to the commit I sent out a message explaining what I was
>> going to do and why, but apparently it didn't make it to the list
>> (which seems to be the case of quite a few mails these days).
>>    =20
>
> What was the From: address and subject of that mail (or any others that
> were apparently lost)? I can't seem to find anything in the dri-devel
> moderation queue mails around the weekend, so apparently it was dropped
> before it reached mailman. Maybe some sf.net spam filter or something.
>
>
>  =20
Hi!
Attaching the mail and another one that was stripped. Furthermore
I had two patches sent by git-send-email stripped away, but when I=20
routed them through the vmware smtp server they arrived.

It might be that sf.net doesn't like my isp email server.

/Thomas.




--------------000705050609020507030501
Content-Type: message/rfc822;
 name="Stripping old ttm....eml"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="Stripping old ttm....eml"

Message-ID: <4A3FFA69.4020400-4+hqylr40dJg9hUCZPvPmw@public.gmane.org>
Date: Mon, 22 Jun 2009 23:40:57 +0200
From: =?ISO-8859-1?Q?Thomas_Hellstr=F6m?= <thomas-4+hqylr40dJg9hUCZPvPmw@public.gmane.org>
User-Agent: Thunderbird 2.0.0.17 (X11/20080926)
MIME-Version: 1.0
To: DRI <dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Subject: Stripping old ttm...
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi!

I'm about to push a commit that strips old TTM from the drm git repo. 
Not sure if anybody uses it for other things than libdrm, but at least 
that will remove some unused code.

The master nouveau driver will be disabled since it depends on old ttm.

/Thomas



--------------000705050609020507030501
Content-Type: message/rfc822;
 name="NEWTTM documentation.eml"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="NEWTTM documentation.eml"

Message-ID: <4A4266E5.1080107-4+hqylr40dJg9hUCZPvPmw@public.gmane.org>
Date: Wed, 24 Jun 2009 19:48:21 +0200
From: =?ISO-8859-1?Q?Thomas_Hellstr=F6m?= <thomas-4+hqylr40dJg9hUCZPvPmw@public.gmane.org>
User-Agent: Thunderbird 2.0.0.17 (X11/20080926)
MIME-Version: 1.0
CC: DRI <dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Subject: Re: NEWTTM documentation
References: <c2673ca60906230758vb557f6bhdf58fcb14e39f082-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
In-Reply-To: <c2673ca60906230758vb557f6bhdf58fcb14e39f082-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Okias,

The documentation available is the Xorg wiki TTM page (a little
outdated) and the ttm header files
which are quite well commented.

Currently there are three drivers using it
1) The Radeon KMS driver using a subset of the TTM functionality.
2) The Intel moorestown / Poulsbo driver which uses the full TTM
functionality including modesetting. Look at the list archives for
pointers to that.
3) The openchrome driver in the modesetting-newttm branch. No
modesetting yet for that one.

Note that the latter 2 drivers are using a tiny TTM user-space interface
which is never going to make it to the mainstream kernel. The openChrome
driver will be patched up to use a driver-specific version of that
interface.

/Thomas


okias wrote:
> Hello,
>
> exist any documentation related to newttm (except already exist
> drivers) + any HowTo for 'convert' fb driver + xorg driver to support
> memory manager + kms?
>
> Thanks
>
> okias
>
> ------------------------------------------------------------------------------
> Are you an open source citizen? Join us for the Open Source Bridge conference!
> Portland, OR, June 17-19. Two days of sessions, one day of unconference: $250.
> Need another reason to go? 24-hour hacker lounge. Register today!
> http://ad.doubleclick.net/clk;215844324;13503038;v?http://opensourcebridge.org
> --
> _______________________________________________
> Dri-devel mailing list
> Dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
> https://lists.sourceforge.net/lists/listinfo/dri-devel
>   




--------------000705050609020507030501
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------000705050609020507030501--
