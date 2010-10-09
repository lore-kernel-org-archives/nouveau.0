From: =?ISO-8859-2?Q?Grzesiek_S=F3jka?= <pld-t9zbU3WrWHI@public.gmane.org>
Subject: Re: dual head X config
Date: Sat, 09 Oct 2010 11:00:43 +0200
Message-ID: <4CB02F3B.2080009@pfu.pl>
References: <4CAF4040.5020409@pfu.pl> <87mxqof6uf.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87mxqof6uf.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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

On 10/09/10 04:16, Francisco Jerez wrote:
>> The problem is that I would like to make the mplayer stretch the movie
>> to both monitors when going into the fullscreen mode. When I was using
>> the binary nvidia driver I used the TwinView to do this. Is it
>> possible using the nouveau driver??
>
> You could try "fake xinerama": http://ktown.kde.org/~seli/fakexinerama/
If I'm getting this right your idea is to use following ~/.fakexinerama 
configuration:

1
0 0 1600 600

assuming that there are two 800x600 displays??
