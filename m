From: Delan Azabani <delan-Boohn7ZbvbpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: hwmon directory structure bug
Date: Sat, 06 Nov 2010 11:47:29 +0800
Message-ID: <4CD4CFD1.3020302@azabani.com>
References: <4CD4A293.5030502@azabani.com> <4CD4BE30.4040409@free.fr>
Reply-To: delan-Boohn7ZbvbpBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4CD4BE30.4040409-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 06/11/10 10:32, Martin Peres wrote:
> Le 06/11/2010 01:34, Delan Azabani a =E9crit :
>> The sensors implementation of nouveau has a bug where the name file is
>> not in hwmonX/device, but in the root of the hwmonX directory. Normally,
>> the name file (contains driver name) of a sensor is placed:
>>
>> /sys/class/hwmon/hwmon<int>/device/name
>>
>> This holds true for coretemp, it8718 and all other sensors I've
>> encountered. Currently, with the latest nouveau from git, the name file
>> is placed as
>>
>> /sys/class/hwmon/hwmon<int>/name
>>
>> This is incorrect and goes against the convention for hwmon directory
>> structure. Not a major bug, but a fix would be very helpful.
> oh, thanks for spotting this, I'll correct my mistake tomorrow.
> =

> Regards,
> =

> Martin
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

No problem, happy to help.

Thanks and best regards,
Delan Azabani
