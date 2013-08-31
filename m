From: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
Subject: Re: [PATCH 1/2] drm/nouveau/bios/therm: handle vbioses
 with duplicate entries (mostly nva5)
Date: Sat, 31 Aug 2013 02:08:48 +0200
Message-ID: <52213410.2010908@labri.fr>
References: <1377907131-15099-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1377907131-15099-1-git-send-email-martin.peres-GANU6spQydw@public.gmane.org>
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

On 31/08/2013 01:58, Martin Peres wrote:
> From: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
>
> Some vbioses have extra useless entries after "the end" of the table. This is
> problematic since all of the vbios I found with this issue redefine the
> pwm freq divider to insane levels (52750 Hz instead of 2500), thus breaking
> fan management.
>
> The first solution to solve this mess would be to change the length of the
> table. The solution I choose was simply to avoid setting the pwm freq twice
> as the other redefinitions are harmless with our current parser.
>
> Signed-off-by: Martin Peres <martin.peres-/ze9ptdxDJdQFI55V6+gNQ@public.gmane.org>

Sorry, the email should be ammended to martin.peres-BktLLJ5BOkI@public.gmane.org (only one b).
