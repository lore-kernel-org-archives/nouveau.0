From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH v3 0/4] Constant folding of new Instructions
Date: Tue, 3 Jun 2014 18:44:50 -0400
Message-ID: <CAKb7UviEM67FzYwQiv4oXvqP2MmYYmR9JqzpQFZSGbfNpyEz-Q@mail.gmail.com>
References: <1401834950-20257-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1401834950-20257-1-git-send-email-tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Series is Reviewed-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>

There are a few minor formatting items that I'll take care of before
pushing this out later tonight... take a look at the changes I made
for the future :)

On Tue, Jun 3, 2014 at 6:35 PM, Tobias Klausmann
<tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> wrote:
> Yet another try for constant folding of Instructions for nvc0.
>
> Please Review this again! (Hopefully the last time ;-) )
>
>
> Tobias Klausmann (4):
>   nvc0/ir: clear subop when folding constant expressions
>   nvc0/ir: Handle reverse subop for OP_EXTBF when folding constant
>     expressions
>   nvc0/ir: Handle OP_BFIND when folding constant expressions
>   nvc0/ir: Handle OP_POPCNT when folding constant expressions
>
>  .../drivers/nouveau/codegen/nv50_ir_peephole.cpp   | 41 ++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)
>
> --
> 1.8.4.5
>
