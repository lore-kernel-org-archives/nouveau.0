From: James Courtier-Dutton <james.dutton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Interlace modes for nouveau and HDMI
Date: Tue, 14 Dec 2010 05:08:32 +0000
Message-ID: <AANLkTikOWbunQtY-et3WeomtNAE3PfATh8PKbtr256jY@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

Hi,

Does nouveau support interlace modes?
It seems to filter out interlace modes in this line in nouveau_connector.c:447:

        list_for_each_entry(mode, &nv_connector->base.probed_modes, head) {
                if (helper->mode_valid(connector, mode) != MODE_OK ||
                    (mode->flags & DRM_MODE_FLAG_INTERLACE))
                        continue;

Why does the nouveau driver do this?

Kind Regards

James
