From: Luca Barbieri <luca.barbieri-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Interrupt setting
Date: Sat, 13 Mar 2010 15:23:01 +0100
Message-ID: <ff13bc9a1003130623t2afc68abj49e3a60262f591fc@mail.gmail.com>
References: <000301cac169$2a657720$7f306560$@is.s.u-tokyo.ac.jp>
	<000b01cac229$148be2c0$3da3a840$@is.s.u-tokyo.ac.jp>
	<586c2acd1003121730m377d3682q9b8df00ed797d765@mail.gmail.com>
	<000301cac24e$cf65bfb0$6e313f10$@is.s.u-tokyo.ac.jp>
	<586c2acd1003122052m37ecc1eex73f9d163031bddfd@mail.gmail.com>
	<000001cac271$8d3898b0$a7a9ca10$@is.s.u-tokyo.ac.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <000001cac271$8d3898b0$a7a9ca10$@is.s.u-tokyo.ac.jp>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Shinpei KATO <shinpei-a3aLqY3FAeqkRP3n4FtbsiGn5s73+xxf@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

> So a GPU itself updates the sequence # of each fence in a specific register, and we can let the Nouveau driver wait for a target
> value to be written.
> Do you know when the value is actually written?

When the FIFO command instructing the GPU to do the write is executed.

> If it is written when a "DMA transfer" is done, we dont know exactly when the corresponding GPU operation is finished.
> Do you think it is possible to wait for a completion of a "GPU operation"?

The current assumption is that FIFO commands are executed
synchronously, so when the FIFO executes the command to update the
fence value, all previous FIFO commands should have been completed.

The current driver just does a CPU busy loop, continuously reading the
fence register until the value read is large enough.

There should be some work by Francisco Jerez and perhaps Ben Skeggs on
using an interrupt-based mechanism instead (the one you described,
most likely), but I'm not sure what the status of that is.
