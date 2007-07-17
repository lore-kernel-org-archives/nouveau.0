From: Patrice Mandin <mandin.patrice-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
Subject: Re: REnouveau crashed my computer
Date: Tue, 17 Jul 2007 23:08:32 +0200
Message-ID: <20070717230832.4db41072.mandin.patrice@wanadoo.fr>
References: <30c82f5f0707140614r40767d49o53a277182e0c3932@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <30c82f5f0707140614r40767d49o53a277182e0c3932-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Le Sat, 14 Jul 2007 15:14:28 +0200
"Louise Hoffman" <louise.hoffman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> a =E9crit:

> When REnouveau came to "74/75 test_interesting_registers" the CPU used
> 100% and I could only use the mouse, but not interact witt anything.

It's happening because this test check if certain hardware registers are
available or not by reading them. And sometimes, it crashes when they
are not available.

> What could be wrong? I am using GeForce 6150 and Fedora 7.

Quick fix: disable this test in the test list in renouveau main.c,
func_store test_funcs[] array by commenting the line. It's the latest
item.

Long fix: check in tests.c test_interesting_regs() function which
register tested make your system crashing. Most likely in nv40_regs[]
array or no_g80_regs[] array.

-- =

Patrice Mandin
WWW: http://pmandin.atari.org/
Programmeur Linux, Atari
Sp=E9cialit=E9: D=E9veloppement, jeux
