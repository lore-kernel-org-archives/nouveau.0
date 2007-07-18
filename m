From: "Louise Hoffman" <louise.hoffman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: REnouveau crashed my computer
Date: Wed, 18 Jul 2007 16:10:36 +0200
Message-ID: <30c82f5f0707180710x39d8d63dm847ea57ee6465295@mail.gmail.com>
References: <30c82f5f0707140614r40767d49o53a277182e0c3932@mail.gmail.com>
	<20070717230832.4db41072.mandin.patrice@wanadoo.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20070717230832.4db41072.mandin.patrice-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Patrice Mandin <mandin.patrice-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

> It's happening because this test check if certain hardware registers are
> available or not by reading them. And sometimes, it crashes when they
> are not available.

Could it be related to that is can't extract the PCIid?

~/download/nouveau$ pciid=`grep /dev/nvidia
rentmp/renouveau/cards/card_stdout.txt | cut -d" " -f10 | head -1 | tr
-t : _`
~/download/nouveau$ echo $pciid
device
~/download/nouveau$

> Quick fix: disable this test in the test list in renouveau main.c,
> func_store test_funcs[] array by commenting the line. It's the latest
> item.

Thanks. I wend with the quick fix =)

How often should I send dumps?

Hugs,
Louise
