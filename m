From: =?ISO-8859-2?Q?Grzesiek_S=F3jka?= <pld-t9zbU3WrWHI@public.gmane.org>
Subject: Re: GeForce FX5200 dual DVI & Samsung 204b
Date: Fri, 01 Oct 2010 12:22:05 +0200
Message-ID: <4CA5B64D.8000608@pfu.pl>
References: <4C9E0167.8000507@pfu.pl>	<20100928004117.0a0ae0ca@daedalus.pq.iki.fi>
	<4CA1C6C0.1000709@pfu.pl>	<20100928170227.00665f76@daedalus.pq.iki.fi>
	<4CA21515.4030903@pfu.pl>	<20100929193136.644e0d68@daedalus.pq.iki.fi>	<878w2jike0.fsf@riseup.net>
	<4CA4A934.4080109@pfu.pl>	<87zkuzgqsv.fsf@riseup.net>
	<4CA4D199.8010403@pfu.pl> <87pqvuhksw.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87pqvuhksw.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 10/01/10 01:29, Francisco Jerez wrote:
> Grzesiek S=F3jka<pld-t9zbU3WrWHI@public.gmane.org>  writes:
>
>> On 09/30/10 18:05, Francisco Jerez wrote:
>>> Does the following command help?
>>> $ xrandr --output DVI-I-2 --set "scaling mode" "None"
>> Yes! Now I have:
>> xrandr --output DVI-I-1 --set "scaling mode" "None"
>> xrandr --output DVI-I-2 --set "scaling mode" "None"
>> in xinitrc. Both displays work fine when Xserver is running. But after I
>> go back to the console the display #1 switches off and #2 starts to
>> blink again. Is it possible to fix the console??
>>
> Do you need to tell the binary driver to do anything special to get it
> working on those monitors? (e.g. manually specified timings or EDID)
No, binary driver works fine without any extra settings. The version I =

used was 173.14.22. With nouveau drivers I'm forced to use the following

Modeline "1600x1200_def" 144  1600 1628 1788 1920  1200 1201 1204 1250

Without it the displays (both) are blinking. Remember that binary nvidia =

claims that the MaxPixClk is 135MHz and nouveau says that it is 175MHz. =

According to the spec it should be 162MHz. I'm not sure but I think that =

this high rate works only with D-SUB. Actually I have 3 monitors and the =

third one is connected with the ancient Matrox Millennium II card using =

the D-SUB cable and it uses the modeline with the 162MHz PixClk.

PS. By the way - I was force to install Win7 and it works with my LCD =

without any drivers installed.
