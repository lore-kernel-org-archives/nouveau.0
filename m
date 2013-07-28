From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: GeForce 8800GT fan control
Date: Sun, 28 Jul 2013 15:09:39 -0400
Message-ID: <51F56C73.4090106@free.fr>
References: <51F401CD.1030000@lockie.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <51F401CD.1030000-ozXLQgHQwDP3fQ9qLvQP4Q@public.gmane.org>
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

On 27/07/2013 13:22, James wrote:
> I have a GeForce 8800GT that I am trying to lower the fan speed on.
> I can change the fan RPM from high to not-as-high but I want more control over it.
> It is too loud and it was quieter with the blob.
> Maybe the temps are too high to make it quieter
Hi James,

Your GPU uses the adt7473 to regulate the fan speed. I would advise you 
to use it in order to drive the fan speed.
Changing Nouveau's fan management mode won't help because the lm sensors 
guys forbid kernel-side access to the
methods of i2c devices. This forbids Nouveau to be the central location 
to drive the fan.

If you, like me, think this is stupid and should be fixed, please be 
aware that we tried but the lack of will on the lmsensors
camp is a real issue.

Good luck using the adt7473!

Martin
