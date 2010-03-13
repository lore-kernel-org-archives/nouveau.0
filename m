From: "Shinpei KATO" <shinpei-a3aLqY3FAeqkRP3n4FtbsiGn5s73+xxf@public.gmane.org>
Subject: Re: Interrupt setting
Date: Sun, 14 Mar 2010 01:47:24 +0900
Message-ID: <000301cac2cc$dd168d00$9743a700$@is.s.u-tokyo.ac.jp>
References: <000301cac169$2a657720$7f306560$@is.s.u-tokyo.ac.jp>		<000b01cac229$148be2c0$3da3a840$@is.s.u-tokyo.ac.jp>		<586c2acd1003121730m377d3682q9b8df00ed797d765@mail.gmail.com>		<000301cac24e$cf65bfb0$6e313f10$@is.s.u-tokyo.ac.jp>		<586c2acd1003122052m37ecc1eex73f9d163031bddfd@mail.gmail.com>		<000001cac271$8d3898b0$a7a9ca10$@is.s.u-tokyo.ac.jp>		<ff13bc9a1003130623t2afc68abj49e3a60262f591fc@mail.gmail.com>		<000001cac2bd$4a8f1920$dfad4b60$@is.s.u-tokyo.ac.jp>		<ff13bc9a1003130710r4747c095jcc5044f4770e6e69@mail.gmail.com>		<000101cac2c5$2cc38f40$864aadc0$@is.s.u-tokyo.ac.jp>	<ff13bc9a1003130811k673d3b36r44980887f51df103@mail.gmail.com>
	<000201cac2cb$6ddb5200$4991f600$@is.s.u-tokyo.ac.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <000201cac2cb$6ddb5200$4991f600$@is.s.u-tokyo.ac.jp>
Content-Language: ja
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: 'Shinpei KATO' <shinpei-a3aLqY3FAeqkRP3n4FtbsiGn5s73+xxf@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Just one more thing.
If two commands, (1) simple DMA data copies and (2) fencing, are executed in
this order, it is possible to have the fence value written before completing DMA
data copies, since DMA and GPU are independent, isn't is?

> -----Original Message-----
> From: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> [mailto:nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org] On Behalf Of Shinpei KATO
> Sent: Sunday, March 14, 2010 1:37 AM
> To: 'Luca Barbieri'
> Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Subject: Re: [Nouveau] Interrupt setting
> 
> Dear Luca,
> 
> > > Since you create one fence object for each pushbuf, I thought that we can
> > > synchronize only with last the command.
> > > Not sure if my assumption is correct...
> > All the commands in the pushbuffer are executed sequentially and the
> > fence setting command is written at the end of the pushbuffer, so when
> > the fence register is updated, all commands will have been already
> > executed.
> >
> > However, this does indeed mean that to wait for the completion of any
> > command, we also need to wait for the completion of all the other
> > commands in the pushbuffer sent in the pushbuf ioctl call.
> 
> Interesting... So fencing at the end of the pushbuf ioctl results in
> synchronizing with not necessarily the last command sent from a CPU but with
> the
> last command finished on a GPU.
> 
> > This could be improved, but I doubt it is worth the significant
> > additional complexity and CPU performance costs. Userspace can always
> > send commands in smaller chunks if it wants to.
> 
> Totally agree with you.
> 
> I learned a lot here, thanks!
> 
> Best,
> - Shinpei
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
